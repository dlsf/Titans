package net.dasunterstrich.aot.listener;

import net.dasunterstrich.aot.AttackOnTitan;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.EntityType;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.persistence.PersistentDataType;

public class EntityDamageByEntityListener implements Listener {

    private final NamespacedKey arrowKey = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isHook");
    private final NamespacedKey titanKey = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isTitan");

    @EventHandler(priority = EventPriority.HIGHEST)
    public void onEntityDamageByEntity(EntityDamageByEntityEvent event) {
        if (event.getDamager().getType() != EntityType.ARROW) {
            return;
        }

        var arrow = event.getDamager();
        if (arrow.getPersistentDataContainer().has(arrowKey, PersistentDataType.STRING)) {
            var hitEntity = event.getEntity();
            if (hitEntity.getPersistentDataContainer().has(titanKey, PersistentDataType.STRING)) {
                hitEntity.addPassenger(arrow);
            }

            event.setCancelled(true);
        }
    }

}
