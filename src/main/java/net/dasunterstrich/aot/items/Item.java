package net.dasunterstrich.aot.items;

import org.bukkit.entity.Player;
import org.bukkit.event.Listener;
import org.bukkit.inventory.ItemStack;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

public abstract class Item implements Listener {

    private final String name;
    private final Set<UUID> users = new HashSet<>();

    public Item(String name) {
        this.name = name;
    }

    public final String getName() {
        return name;
    }

    public abstract ItemStack getItemStack();

    public void register(Player player) {
        users.add(player.getUniqueId());
    }

    public void unregister(Player player) {
        users.remove(player.getUniqueId());
    }

    public final Set<UUID> getUsers() {
        return users;
    }

}
