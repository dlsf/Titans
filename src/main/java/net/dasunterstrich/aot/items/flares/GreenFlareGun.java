package net.dasunterstrich.aot.items.flares;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.items.FlareGun;
import net.dasunterstrich.aot.utils.CooldownProvider;
import net.dasunterstrich.aot.utils.ItemBuilder;
import org.bukkit.Color;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import java.time.Duration;

public class GreenFlareGun extends FlareGun {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final CooldownProvider<Player> cooldownProvider = CooldownProvider.newInstance(Duration.ofSeconds(10));

    public GreenFlareGun() {
        super("GreenFlareGun", Color.GREEN);
    }

    @Override
    public CooldownProvider<Player> getCooldownProvider() {
        return cooldownProvider;
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_GREEN_FLARE_NAME))
                .customModelData(10001)
                .build();
    }

}
