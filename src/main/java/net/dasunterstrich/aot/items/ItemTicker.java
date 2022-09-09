package net.dasunterstrich.aot.items;

import org.bukkit.Bukkit;
import org.bukkit.plugin.Plugin;

public class ItemTicker {

    private static Plugin plugin;

    public static void start(Plugin plugin) {
        ItemTicker.plugin = plugin;

        for (Items item : Items.values()) {
            if (item.getItem() instanceof TickingItem tickingItem) {
                startTicking(tickingItem);
            }
        }
    }

    private static void startTicking(TickingItem item) {
        Bukkit.getScheduler().scheduleSyncRepeatingTask(plugin, item::tick, 0L, item.tickSpeed);
    }

}
