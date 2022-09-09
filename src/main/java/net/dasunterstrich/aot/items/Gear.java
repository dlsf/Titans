package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.items.hook.HookManager;
import net.dasunterstrich.aot.utils.CooldownProvider;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.block.Action;
import org.bukkit.event.player.PlayerInteractEvent;

import java.time.Duration;

public abstract class Gear extends Item {

    private final CooldownProvider<Player> cooldownProvider = CooldownProvider.newInstance(Duration.ofMillis(250));
    private final HookManager hookManager = HookManager.getInstance();

    public Gear(String name) {
        super(name);

        hookManager.startTask();
    }

    @EventHandler
    public void onInteract(PlayerInteractEvent event) {
        if (event.getAction() != Action.RIGHT_CLICK_AIR && event.getAction() != Action.RIGHT_CLICK_BLOCK) {
            return;
        }

        var player = event.getPlayer();
        if (cooldownProvider.isOnCooldown(player)) {
            return;
        }

        cooldownProvider.applyCooldown(player);

        var offhandItem = player.getInventory().getItemInOffHand();
        if (!getItemStack().equals(offhandItem)) {
            return;
        }

        if (player.getVehicle() != null) {
            return;
        }

        var handItem = player.getInventory().getItemInMainHand();
        for (Items flareGun : Items.getFlareGuns()) {
            if (flareGun.getItem().getItemStack().equals(handItem)) {
                return;
            }
        }

        if (Items.SHOT_GUNS.getItem().getItemStack().equals(handItem)) {
            return;
        }

        if (handItem.getType().isEdible()) {
            return;
        }

        if (hookManager.hasHook(player)) {
            hookManager.removeHook(player);
        } else {
            hookManager.fireHook(player);
        }
    }

}
