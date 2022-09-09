package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.AttackOnTitan;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.utils.CooldownProvider;
import net.dasunterstrich.aot.utils.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.LivingEntity;
import org.bukkit.entity.Player;
import org.bukkit.entity.Snowball;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.block.Action;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.inventory.ItemStack;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.util.Vector;

import java.time.Duration;
import java.util.concurrent.ThreadLocalRandom;

public class AntiPersonnelShotGuns extends Item {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final CooldownProvider<Player> cooldownProvider = CooldownProvider.newInstance(Duration.ofMillis(750));
    private final NamespacedKey key = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isBullet");
    private final int bulletAmount = 3;
    private final double spread = 0.15;
    private final double damage = 5.0;

    public AntiPersonnelShotGuns() {
        super("ShotGuns");
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_ANTI_PERSONNEL_SHOT_GUNS_NAME))
                .customModelData(20000)
                .build();
    }

    @EventHandler(priority = EventPriority.LOW)
    public void onPlayerInteract(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_AIR && event.getAction() != Action.RIGHT_CLICK_BLOCK) {
            return;
        }

        var player = event.getPlayer();
        var handItem = player.getInventory().getItemInMainHand();
        if (!getItemStack().equals(handItem)) {
            return;
        }

        if (cooldownProvider.isOnCooldown(player)) {
            return;
        }

        cooldownProvider.applyCooldown(player);

        var offhandItem = player.getInventory().getItemInOffHand();
        if (!Items.ANTI_PERSONNEL_GEAR.getItem().getItemStack().equals(offhandItem)) {
            return;
        }

        event.setCancelled(true);
        for (int i = 0; i < bulletAmount; i++) {
            fireProjectile(player);
        }
    }

    private void fireProjectile(Player player) {
        var randomX = ThreadLocalRandom.current().nextDouble(-spread, spread);
        var randomY = ThreadLocalRandom.current().nextDouble(-spread, spread);
        var randomZ = ThreadLocalRandom.current().nextDouble(-spread, spread);
        var vector = player.getLocation().getDirection().normalize().multiply(1.5).add(new Vector(randomX, randomY, randomZ));
        var projectile = player.launchProjectile(Snowball.class, vector);
        projectile.getPersistentDataContainer().set(key, PersistentDataType.STRING, "true");
    }

    @EventHandler
    public void onProjectileHit(EntityDamageByEntityEvent event) {
        if (event.getDamager().getType() != EntityType.SNOWBALL) {
            return;
        }

        var projectile = event.getDamager();
        if (!projectile.getPersistentDataContainer().has(key, PersistentDataType.STRING)) {
            return;
        }

        var entity = event.getEntity();
        if (!(entity instanceof LivingEntity)) {
            return;
        }

        event.setDamage(damage);
    }

}
