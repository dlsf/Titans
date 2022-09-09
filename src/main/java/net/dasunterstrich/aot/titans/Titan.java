package net.dasunterstrich.aot.titans;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.utils.PlaneUtils;
import org.bukkit.Location;
import org.bukkit.entity.Husk;
import org.bukkit.entity.Player;
import org.bukkit.entity.Zombie;

public class Titan {

    private final Husk husk;
    private final Zombie zombie;
    private Player targetPlayer;
    private boolean spawned = false;

    public Titan(Husk husk, Zombie zombie) {
        this.husk = husk;
        this.zombie = zombie;
    }

    public void teleport(Location location) {
        var footLocation = location.clone().subtract(0, 6, 0);
        while (!footLocation.getBlock().getType().isSolid()) {
            footLocation = footLocation.subtract(0, 1, 0);
        }

        if (!spawned) {
            zombie.teleport(footLocation.add(0, 1, 0));
            spawned = true;
        }

        husk.teleport(footLocation.add(0, 6, 0));
    }

    public void attackNearbyPlayers() {
        var attackDistanceSquared = Math.pow(ConfigurationProvider.getInstance().getDouble(MainConfig.TITAN_ATTACK_RANGE), 2);
        var damage = ConfigurationProvider.getInstance().getDouble(MainConfig.TITAN_DAMAGE);
        var nearbyPlayers = husk.getWorld().getPlayers().stream().filter(player -> canAttack(player, attackDistanceSquared)).toList();

        nearbyPlayers.forEach(player -> player.damage(damage, husk));
    }

    public boolean canAttack(Player player, double attackDistanceSquared) {
        var playerLocation = player.getLocation();
        var isInFrontOfHead = playerLocation.distanceSquared(husk.getEyeLocation()) <= attackDistanceSquared && PlaneUtils.isOnSameSideOfPlane(husk.getLocation(), player.getLocation());
        var isInFrontOfFoot = playerLocation.distanceSquared(husk.getLocation().subtract(0, 5, 0)) <= attackDistanceSquared;

        return (isInFrontOfHead || isInFrontOfFoot) && husk.hasLineOfSight(player);
    }

    public boolean canTarget(Player player) {
        return husk.hasLineOfSight(player) && PlaneUtils.isOnSameSideOfPlane(husk.getLocation(), player.getLocation());
    }

    public void walk() {
        var location = zombie.getLocation().clone().add(0, 6, 0);

        teleport(location);
        husk.setTarget(zombie.getTarget());
    }

    public Husk getHusk() {
        return husk;
    }

    public Zombie getZombie() {
        return zombie;
    }

    public boolean hasTarget() {
        return targetPlayer != null;
    }

    public Player getTargetPlayer() {
        return targetPlayer;
    }

    public void setTargetPlayer(Player targetPlayer) {
        this.targetPlayer = targetPlayer;
    }

}
