package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.utils.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.inventory.ItemStack;

public class SteelSwords extends Item {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();

    public SteelSwords() {
        super("SteelSwords");
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_STEEL_SWORDS_NAME))
                .customModelData(10000)
                .build();
    }

    @EventHandler(ignoreCancelled = true)
    public void onPlayerInteract(EntityDamageByEntityEvent event) {
        if (event.getDamager().getType() != EntityType.PLAYER) {
            return;
        }

        var player = (Player) event.getDamager();
        var handItem = player.getInventory().getItemInMainHand();
        if (!getItemStack().equals(handItem)) {
            return;
        }

        var offhandItem = player.getInventory().getItemInOffHand();
        if (Items.PERSONAL_GEAR.getItem().getItemStack().equals(offhandItem)) {
            return;
        }

        event.setCancelled(true);
    }

}
