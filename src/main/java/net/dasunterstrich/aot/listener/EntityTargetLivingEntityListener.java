package net.dasunterstrich.aot.listener;

import net.dasunterstrich.aot.items.Items;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityTargetLivingEntityEvent;

public class EntityTargetLivingEntityListener implements Listener {

    @EventHandler
    public void onEntityTargetLivingEntity(EntityTargetLivingEntityEvent event) {
        if (event.getEntityType() != EntityType.PIG) {
            return;
        }

        if (!(event.getTarget() instanceof Player player)) {
            return;
        }

        if (!Items.hasAOTItemEquiped(player)) {
            return;
        }

        event.setCancelled(true);
    }

}
