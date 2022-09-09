package net.dasunterstrich.aot.items.hook;

import com.comphenix.protocol.PacketType;
import com.comphenix.protocol.ProtocolLibrary;
import net.dasunterstrich.aot.AttackOnTitan;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import org.bukkit.Bukkit;
import org.bukkit.Color;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.Particle;
import org.bukkit.entity.ArmorStand;
import org.bukkit.entity.Arrow;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.potion.PotionEffect;
import org.bukkit.potion.PotionEffectType;
import org.bukkit.util.EulerAngle;
import org.bukkit.util.Vector;

import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

public class Hook {

    private final static ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final static NamespacedKey key = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isHook");
    private final UUID playerUUID;
    private int ticks = 0;
    private boolean hitGround = false;
    private boolean inTitan = false;
    private Arrow firstArrow = null;
    private Arrow secondArrow = null;
    private ArmorStand firstArmorstand = null;
    private ArmorStand secondArmorstand = null;

    public Hook(Player player) {
        this.playerUUID = player.getUniqueId();
    }

    public void spawn() {
        var player = Bukkit.getPlayer(playerUUID);
        if (player == null) {
            return;
        }

        var playerLocation = player.getLocation();
        var horizontalVector = playerLocation.getDirection().crossProduct(new Vector(0, 1, 0)).normalize().multiply(0.5);
        var firstArrowLocation = playerLocation.clone().add(horizontalVector).add(0, 0.75, 0).add(playerLocation.getDirection().multiply(0.75));
        var secondArrowLocation = playerLocation.clone().add(horizontalVector.multiply(-1)).add(0, 0.75, 0).add(playerLocation.getDirection().multiply(0.75));

        var world = player.getWorld();
        firstArrow = (Arrow) world.spawnEntity(firstArrowLocation, EntityType.ARROW);
        secondArrow = (Arrow) world.spawnEntity(secondArrowLocation, EntityType.ARROW);

        firstArrow.setVelocity(playerLocation.getDirection().multiply(3));
        secondArrow.setVelocity(playerLocation.getDirection().multiply(3));

        firstArrow.setSilent(true);
        secondArrow.setSilent(true);

        firstArrow.getPersistentDataContainer().set(key, PersistentDataType.STRING, "true");
        secondArrow.getPersistentDataContainer().set(key, PersistentDataType.STRING, "true");

        //makeInvisible(firstArrow);
        //makeInvisible(secondArrow);

        firstArmorstand = (ArmorStand) world.spawnEntity(firstArrowLocation, EntityType.ARMOR_STAND);
        secondArmorstand = (ArmorStand) world.spawnEntity(secondArrowLocation, EntityType.ARMOR_STAND);

        firstArmorstand.setInvulnerable(true);
        secondArmorstand.setInvulnerable(true);

        firstArmorstand.setSmall(true);
        secondArmorstand.setSmall(true);

        firstArmorstand.setInvisible(true);
        secondArmorstand.setInvisible(true);

        firstArmorstand.getEquipment().setItemInOffHand(new ItemStack(Material.NETHERITE_PICKAXE));
        secondArmorstand.getEquipment().setItemInMainHand(new ItemStack(Material.NETHERITE_PICKAXE));

        firstArmorstand.setCollidable(false);
        secondArmorstand.setCollidable(false);

        firstArmorstand.setRightArmPose(new EulerAngle(0.0872665, -0, -0));
        secondArmorstand.setRightArmPose(new EulerAngle(0.0872665, -0, -0));

        firstArrow.addPassenger(firstArmorstand);
        secondArrow.addPassenger(secondArmorstand);
    }

    // TODO
    private void makeInvisible(Arrow arrow) {
        var protocolManager = ProtocolLibrary.getProtocolManager();
        var packet = protocolManager.createPacket(PacketType.Play.Server.ENTITY_DESTROY);
        packet.getIntegerArrays().write(0, new int[] { arrow.getEntityId() });

        Bukkit.getOnlinePlayers().forEach(player -> {
            try {
                protocolManager.sendServerPacket(player, packet);
            } catch (InvocationTargetException exception) {
                exception.printStackTrace();
            }
        });
    }

    public void despawn() {
        var location = getVelocityTargetLocation();

        firstArrow.remove();
        secondArrow.remove();

        firstArmorstand.remove();
        secondArmorstand.remove();

        var player = Bukkit.getPlayer(playerUUID);
        if (player == null) {
            return;
        }

        player.removePotionEffect(PotionEffectType.SLOW_FALLING);
        player.addPotionEffect(new PotionEffect(PotionEffectType.SLOW_FALLING, configurationProvider.getInt(MainConfig.HOOK_SLOW_FALLING_DURATION), 1, false, false, false));

        if (hitGround && player.getLocation().distanceSquared(location) > 2) {
            Vector velocity = calculateVelocity(player.getLocation(), location);
            player.setVelocity(new Vector(0, 0.5, 0));
            Bukkit.getScheduler().runTaskLater(AttackOnTitan.getPlugin(AttackOnTitan.class), () -> player.setVelocity(velocity), 4L);
        }
    }

    private Location getVelocityTargetLocation() {
        if (firstArrow.isInBlock() && secondArrow.isInBlock()) {
            return firstArmorstand.getLocation().add(secondArmorstand.getLocation()).multiply(0.5);
        } else if (firstArrow.isInBlock() && !secondArrow.isInBlock()) {
            return firstArmorstand.getLocation();
        } else if (!firstArrow.isInBlock() && secondArrow.isInBlock()) {
            return secondArmorstand.getLocation();
        } else {
            return firstArmorstand.getLocation().add(secondArmorstand.getLocation()).multiply(0.5);
        }
    }

    /*
    My attempts to construct a vector for the grappling hook which feels right.
    The multiplication factor is the strength of the grappling hook, the additionalY
    so players reach far-away places.

    There are various hardcoded fixes for locations which are too far away, too close,
    too far down, too far up, ...

    Please don't question this code, but if you have to, you have my sincerest apologies.
     */
    private Vector calculateVelocity(Location playerLocation, Location targetLocation) {
        var multiplicationFactor = 2.5;
        var additionalY = 0.0;
        var distanceSquared = playerLocation.distanceSquared(targetLocation);
        if (distanceSquared > 25 * 25) {
            multiplicationFactor += Math.sqrt(distanceSquared - (25 * 25)) / 10;

            if (yDifference(playerLocation, targetLocation) > 5 || distanceSquared > 50 * 50) {
                additionalY += 3;
            } else {
                additionalY += 1;
            }

            double defaultY = targetLocation.toVector().subtract(playerLocation.toVector()).normalize().multiply(multiplicationFactor).getY();
            if (Math.signum(defaultY) == -1 && defaultY + additionalY > -0.5) {
                additionalY = 0;
            }

            if (inTitan) {
                multiplicationFactor /= 2;
                additionalY = -0.4;
            }
        } else if (distanceSquared < 5 * 5 || distanceSquared < 10 * 10 && yDifference(targetLocation, playerLocation) < 1.5) {
            multiplicationFactor = 1;
        } else if (inTitan) {
            multiplicationFactor = 1.5;
            additionalY = -0.4;
        }

        var velocity = targetLocation.toVector().subtract(playerLocation.toVector()).normalize().multiply(multiplicationFactor).add(new Vector(0, additionalY, 0));
        if (Math.abs(velocity.getY()) > 1.75) {
            velocity = velocity.setY(Math.signum(velocity.getY()) * 1.75);
        }

        if (yDifference(playerLocation, targetLocation) < 2.5 && velocity.getY() > 0) {
            velocity = velocity.setY(velocity.getY() * 1.5);
        }

        return velocity;
    }

    private double yDifference(Location firstLocation, Location secondLocation) {
        return Math.abs(firstLocation.getY() - secondLocation.getY());
    }

    public void tick() {
        var player = Bukkit.getPlayer(playerUUID);
        if (player == null) {
            return;
        }

        player.removePotionEffect(PotionEffectType.SLOW_FALLING);
        player.addPotionEffect(new PotionEffect(PotionEffectType.SLOW_FALLING, 20, 1, false, false, false));

        if (hasHit(firstArrow) || hasHit(secondArrow)) {
            hitGround = true;
            ticks++;

            if (firstArrow.isInsideVehicle() && !secondArrow.isInsideVehicle()) {
                inTitan = true;
                firstArrow.getVehicle().addPassenger(secondArrow);
            }

            if (secondArrow.isInsideVehicle() && !firstArrow.isInsideVehicle()) {
                inTitan = true;
                secondArrow.getVehicle().addPassenger(firstArrow);
            }

            return;
        }

        var world = firstArrow.getWorld();
        world.spawnParticle(Particle.REDSTONE, firstArmorstand.getLocation().add(0, 1, 0), 100, 0, 0, 0, Integer.MAX_VALUE, new Particle.DustOptions(Color.BLACK, 0.5f), true);
        world.spawnParticle(Particle.REDSTONE, secondArmorstand.getLocation().add(0, 1, 0), 100, 0, 0, 0, 0, new Particle.DustOptions(Color.BLACK, 0.5f), true);

        ticks++;
    }

    private boolean hasHit(Arrow arrow) {
        return arrow.isInBlock() || arrow.isInsideVehicle();
    }

    public int getTicks() {
        return ticks;
    }

}
