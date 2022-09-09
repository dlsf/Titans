package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.items.hook.HookManager;
import net.dasunterstrich.aot.utils.CooldownProvider;
import net.dasunterstrich.aot.utils.ItemBuilder;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import java.time.Duration;

public class AntiPersonnelGear extends Gear {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final CooldownProvider<Player> cooldownProvider = CooldownProvider.newInstance(Duration.ofMillis(250));
    private final HookManager hookManager = HookManager.getInstance();

    public AntiPersonnelGear() {
        super("AntiPersonnelGear");
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_ANTI_PERSONNEL_GEAR_NAME))
                .customModelData(20001)
                .build();
    }



}
