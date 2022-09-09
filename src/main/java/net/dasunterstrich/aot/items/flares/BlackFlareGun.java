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

public class BlackFlareGun extends FlareGun {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final CooldownProvider<Player> cooldownProvider = CooldownProvider.newInstance(Duration.ofSeconds(10));

    public BlackFlareGun() {
        super("BlackFlareGun", Color.BLACK);
    }

    @Override
    public CooldownProvider<Player> getCooldownProvider() {
        return cooldownProvider;
    }

    @Override
    public ItemStack getItemStack() {
        return new ItemBuilder(Material.CARROT_ON_A_STICK)
                .name(configurationProvider.getString(MainConfig.ITEM_BLACK_FLARE_NAME))
                .customModelData(10001)
                .build();
    }

}
