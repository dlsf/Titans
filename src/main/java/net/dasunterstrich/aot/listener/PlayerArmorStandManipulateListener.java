package net.dasunterstrich.aot.listener;

import net.dasunterstrich.aot.AttackOnTitan;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.EntityType;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerArmorStandManipulateEvent;
import org.bukkit.persistence.PersistentDataType;

public class PlayerArmorStandManipulateListener implements Listener {

    private final NamespacedKey key = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isHook");

    @EventHandler
    public void onPlayerArmorStandManipulate(PlayerArmorStandManipulateEvent event) {
        var vehicle = event.getRightClicked().getVehicle();
        if (vehicle == null || vehicle.getType() != EntityType.ARROW) {
            return;
        }

        if (!vehicle.getPersistentDataContainer().has(key, PersistentDataType.STRING)) {
            return;
        }

        event.setCancelled(true);
    }

}
