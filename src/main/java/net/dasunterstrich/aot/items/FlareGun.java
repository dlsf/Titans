package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.utils.CooldownProvider;
import org.bukkit.Color;
import org.bukkit.Particle;
import org.bukkit.entity.Arrow;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;

import java.util.HashSet;
import java.util.Set;

public abstract class FlareGun extends TickingItem {

    private final Set<Arrow> flares = new HashSet<>();
    private final Color color;

    public FlareGun(String name, Color color) {
        super(name, 1);

        this.color = color;
    }

    public abstract CooldownProvider<Player> getCooldownProvider();

    public void shoot(Player player) {
        var world = player.getWorld();
        var location = player.getLocation().add(player.getLocation().getDirection().normalize().multiply(2));

        var arrow = (Arrow) world.spawnEntity(location, EntityType.ARROW);
        arrow.setVelocity(player.getLocation().getDirection().normalize().multiply(4));
        //TODO: arrow.addCustomEffect(new PotionEffect(PotionEffectType.INVISIBILITY, Integer.MAX_VALUE, 1, false, false, false), true);
        flares.add(arrow);
    }

    @Override
    public void tick() {
        var removalList = new HashSet<Arrow>();

        for (Arrow flare : flares) {
            if (flare.isInBlock()) {
                flare.remove();
                removalList.add(flare);
                continue;
            }

            var world = flare.getWorld();
            world.spawnParticle(Particle.REDSTONE, flare.getLocation(), 75, 0, 0, 0, 20 * 120, new Particle.DustOptions(color, 5f), true);
        }

        flares.removeAll(removalList);
    }

    @EventHandler
    public void onPlayerInteract(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_AIR) {
            return;
        }

        var player = event.getPlayer();
        var handItem = player.getInventory().getItemInMainHand();
        if (!getItemStack().equals(handItem)) {
            return;
        }

        if (getCooldownProvider().isOnCooldown(player)) {
            return;
        }

        getCooldownProvider().applyCooldown(player);
        shoot(player);
    }

}
