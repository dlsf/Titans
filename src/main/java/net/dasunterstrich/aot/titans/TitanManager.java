package net.dasunterstrich.aot.titans;

import net.dasunterstrich.aot.AttackOnTitan;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.items.Items;
import net.dasunterstrich.aot.utils.ItemBuilder;
import net.dasunterstrich.aot.utils.PlaneUtils;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.Particle;
import org.bukkit.World;
import org.bukkit.attribute.Attribute;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Husk;
import org.bukkit.entity.Player;
import org.bukkit.entity.Zombie;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.entity.EntityDeathEvent;
import org.bukkit.event.player.PlayerToggleSneakEvent;
import org.bukkit.inventory.ItemStack;
import org.bukkit.persistence.PersistentDataType;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;
import java.util.regex.Pattern;

public class TitanManager implements Listener {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final Set<Titan> titans = new HashSet<>();
    private final NamespacedKey key = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isTitan");

    public void startTicking() {
        Bukkit.getScheduler().runTaskTimerAsynchronously(AttackOnTitan.getPlugin(AttackOnTitan.class), this::findTargets, 0, 20L);
        Bukkit.getScheduler().scheduleSyncRepeatingTask(AttackOnTitan.getPlugin(AttackOnTitan.class), this::followTargets, 0, 2L);
        Bukkit.getScheduler().scheduleSyncRepeatingTask(AttackOnTitan.getPlugin(AttackOnTitan.class), this::attackTargets, 0, 15L);
    }

    private void findTargets() {
        for (Titan titan : titans) {
            var viewRangeSquared = Math.pow(configurationProvider.getDouble(MainConfig.TITAN_VIEW_DISTANCE), 2);
            if (titan.hasTarget() && titan.getHusk().hasLineOfSight(titan.getTargetPlayer())) {
                return;
            }

            var nearbyPlayers = titan.getHusk().getWorld().getPlayers().stream()
                    .filter(player -> titan.canTarget(player) && titan.getHusk().getLocation().distanceSquared(player.getLocation()) <= viewRangeSquared)
                    .toList();

            if (nearbyPlayers.isEmpty()) {
                return;
            }

            int randomIndex = ThreadLocalRandom.current().nextInt(nearbyPlayers.size());
            titan.setTargetPlayer(nearbyPlayers.get(randomIndex));
        }
    }

    private void followTargets() {
        titans.forEach(Titan::walk);
    }

    private void attackTargets() {
        // Check if the titan can actually attack anything is handled by the Titan class
        titans.forEach(Titan::attackNearbyPlayers);
    }

    public void spawn(Location location) {
        var husk = (Husk) location.getWorld().spawnEntity(location, EntityType.HUSK, false);
        husk.getAttribute(Attribute.GENERIC_ATTACK_DAMAGE).setBaseValue(configurationProvider.getLong(MainConfig.TITAN_DAMAGE));
        husk.getAttribute(Attribute.GENERIC_MAX_HEALTH).setBaseValue(configurationProvider.getLong(MainConfig.TITAN_HEALTH));
        husk.setHealth(configurationProvider.getLong(MainConfig.TITAN_HEALTH));
        husk.setSilent(true);
        husk.setGravity(true); // TODO
        husk.setInvisible(true);
        husk.setPersistent(true);
        husk.setRemoveWhenFarAway(false);
        husk.getPersistentDataContainer().set(key, PersistentDataType.STRING, "true");

        // Experimental
        //husk.setAI(false);
        var zombie = (Zombie) location.getWorld().spawnEntity(location, EntityType.HUSK, false);
        zombie.setInvisible(true);
        zombie.setSilent(true);
        zombie.setInvulnerable(true);
        zombie.getAttribute(Attribute.GENERIC_ATTACK_KNOCKBACK).setBaseValue(0);
        zombie.getAttribute(Attribute.GENERIC_ATTACK_DAMAGE).setBaseValue(0);
        zombie.getPersistentDataContainer().set(key, PersistentDataType.STRING, "true");

        var headItem = new ItemBuilder(Material.INK_SAC).customModelData(configurationProvider.getInt(MainConfig.TITAN_MODEL_DATA)).build();
        husk.getEquipment().setHelmet(headItem);

        var titan = new Titan(husk, zombie);
        titans.add(titan);

        teleport(titan, location.getWorld(), location.getX(), location.getY(), location.getZ());
    }

    public void teleport(Titan titan, World world, double x, double y, double z) {
        titan.teleport(new Location(world, x, y + configurationProvider.getInt(MainConfig.TITAN_SPAWN_HEIGHT), z));
    }

    @EventHandler
    public void onEntityDamageByEntity(EntityDamageByEntityEvent event) {
        if (event.getEntityType() != EntityType.HUSK) {
            return;
        }

        if (event.getDamager().getType() != EntityType.PLAYER) {
            return;
        }

        var titan = (Husk) event.getEntity();
        if (!titan.getPersistentDataContainer().has(key, PersistentDataType.STRING)) {
            return;
        }

        if (titans.stream().noneMatch(t -> t.getHusk().getEntityId() == titan.getEntityId())) {
            titan.remove();
            spawn(titan.getLocation());
        }

        var player = (Player) event.getDamager();
        var handItem = player.getInventory().getItemInMainHand();
        if (!Items.STEEL_SWORD.getItem().getItemStack().equals(handItem)) {
            event.setCancelled(true);
            return;
        }

        if (!PlaneUtils.isOnSameSideOfPlane(titan.getLocation(), player.getLocation())) {
            event.setCancelled(true);
            return;
        }

        if (player.getLocation().distanceSquared(titan.getLocation().subtract(0, 5, 0)) < 1.5) {
            return;
        }

        var damage = getRandomNumber(configurationProvider.getInt(MainConfig.MIN_SWORD_DAMAGE), configurationProvider.getInt(MainConfig.MAX_SWORD_DAMAGE) + 1);
        event.setDamage(damage);
    }

    @EventHandler
    public void onEntityDeath(EntityDeathEvent event) {
        var entity = event.getEntity();
        if (!entity.getPersistentDataContainer().has(key, PersistentDataType.STRING)) {
            return;
        }

        entity.getWorld().spawnParticle(Particle.BLOCK_CRACK, entity.getLocation(), 50, 1, 1, 1, 0, Material.NETHER_WART_BLOCK.createBlockData(), true);

        event.getDrops().clear();
        event.setDroppedExp(0);

        if (entity.getKiller() != null) {
            event.getDrops().addAll(getDrops(entity.getKiller()));
        }

        titans.removeIf(titan -> titan.getHusk().getEntityId() == entity.getEntityId());
    }

    private List<ItemStack> getDrops(Player player) {
        var dropChances = configurationProvider.getStringList(MainConfig.TITAN_DROP_CHANCES);
        var finalDrops = new ArrayList<ItemStack>();
        var commandPattern = Pattern.compile("cmd\\|(.+)\\|(\\d+)\\|(\\d+)-(\\d+)");
        var itemPattern = Pattern.compile("([\\w_0-9]+)\\|(\\d+)\\|(\\d+)-(\\d+)");

        for (String drop : dropChances) {
            var commandMatcher = commandPattern.matcher(drop);
            if (commandMatcher.find()) {
                String command = commandMatcher.group(1);
                if (getRandomNumber(0, Integer.parseInt(commandMatcher.group(2))) != 0) {
                    continue;
                }

                int randomAmount = getRandomNumber(Integer.parseInt(commandMatcher.group(3)), Integer.parseInt(commandMatcher.group(4)));
                Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command.replace("%player%", player.getName())
                        .replace("%amount%", String.valueOf(randomAmount)));
                continue;
            }

            var itemMatcher = itemPattern.matcher(drop);
            if (itemMatcher.find()) {
                Material material = Material.valueOf(itemMatcher.group(1));
                if (getRandomNumber(0, Integer.parseInt(itemMatcher.group(2))) != 0) {
                    continue;
                }

                int amount = getRandomNumber(Integer.parseInt(itemMatcher.group(3)), Integer.parseInt(itemMatcher.group(4)) + 1);
                ItemStack itemStack = new ItemBuilder(material).amount(amount).build();
                finalDrops.add(itemStack);
            }
        }

        return finalDrops;
    }

    private int getRandomNumber(int min, int max) {
        return ThreadLocalRandom.current().nextInt(min, max);
    }

    public void removeAll() {
        titans.forEach(titan -> {
            titan.getHusk().remove();
            titan.getZombie().remove();
        });
    }

    // TODO
    boolean started;

    @EventHandler
    public void onSneak(PlayerToggleSneakEvent event) {
        if (titans.isEmpty()) return;
        if (started) return;
        started = true;
//
        //Bukkit.getScheduler().scheduleSyncRepeatingTask(AttackOnTitan.getPlugin(AttackOnTitan.class), () -> {
        //    var husk = titans.stream().findAny().get().getHusk();
        //    var direction = husk.getLocation().getDirection();
        //    direction.setY(0);
        //    husk.teleport(husk.getLocation().add(direction.multiply(0.25)));
        //}, 0L, 1L);
    }

}
