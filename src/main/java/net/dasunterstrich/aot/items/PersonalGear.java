package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.utils.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

public class PersonalGear extends Gear {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();

    public PersonalGear() {
        super("PersonalGear");
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_PERSONAL_GEAR_NAME))
                .customModelData(10002)
                .build();
    }

}
