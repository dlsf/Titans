package net.dasunterstrich.aot.listener;

import net.dasunterstrich.aot.items.Items;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerSwapHandItemsEvent;

public class PlayerSwapHandItemsListener implements Listener {

    @EventHandler(priority = EventPriority.HIGHEST, ignoreCancelled = true)
    public void onPlayerSwapHandItems(PlayerSwapHandItemsEvent event) {
        var player = event.getPlayer();
        var offhandItem = event.getOffHandItem();

        for (Items item : Items.values()) {
            var itemStack = item.getItem().getItemStack();
            if (itemStack.equals(offhandItem)) {
                item.getItem().register(player);
            }

            if (item.getItem().getUsers().contains(player.getUniqueId()) && !itemStack.equals(offhandItem)) {
                item.getItem().unregister(player);
            }
        }
    }

}
