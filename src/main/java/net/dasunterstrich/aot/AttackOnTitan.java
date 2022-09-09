package net.dasunterstrich.aot;

import net.dasunterstrich.aot.commands.AotItemCommand;
import net.dasunterstrich.aot.commands.AotSpawnerCommand;
import net.dasunterstrich.aot.commands.SpawnTitanCommand;
import net.dasunterstrich.aot.configuration.ConfigFile;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.items.ItemTicker;
import net.dasunterstrich.aot.items.Items;
import net.dasunterstrich.aot.listener.EntityDamageByEntityListener;
import net.dasunterstrich.aot.listener.EntityTargetLivingEntityListener;
import net.dasunterstrich.aot.listener.PlayerArmorStandManipulateListener;
import net.dasunterstrich.aot.listener.PlayerDamageListener;
import net.dasunterstrich.aot.listener.PlayerSwapHandItemsListener;
import net.dasunterstrich.aot.spawner.SpawnerManager;
import net.dasunterstrich.aot.titans.TitanManager;
import org.bukkit.Bukkit;
import org.bukkit.plugin.PluginManager;
import org.bukkit.plugin.java.JavaPlugin;

public class AttackOnTitan extends JavaPlugin {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private TitanManager titanManager;
    private SpawnerManager spawnerManager;

    @Override
    public void onEnable() {
        initializeConfigs();

        this.titanManager = new TitanManager();
        this.spawnerManager = new SpawnerManager(this, titanManager);

        registerCommands();
        registerListener();

        titanManager.startTicking();
        ItemTicker.start(this);

        getLogger().info("Das Plugin wurde erfolgreich gestartet!");
    }

    @Override
    public void onDisable() {
        if (configurationProvider.getBoolean(MainConfig.SHUTDOWN_REMOVE_TITANS)) {
            titanManager.removeAll();
        }
    }

    private void initializeConfigs() {
        var mainConfigFile = new ConfigFile("config.yml", this);
        this.configurationProvider.register(MainConfig.class, mainConfigFile);
        this.configurationProvider.saveDefaultConfig(MainConfig.values());
    }

    private void registerCommands() {
        getCommand("aotitem").setExecutor(new AotItemCommand());
        getCommand("aotspawner").setExecutor(new AotSpawnerCommand(spawnerManager));
        getCommand("spawntitan").setExecutor(new SpawnTitanCommand(titanManager));
    }

    private void registerListener() {
        PluginManager pluginManager = Bukkit.getPluginManager();
        pluginManager.registerEvents(new EntityDamageByEntityListener(), this);
        pluginManager.registerEvents(new EntityTargetLivingEntityListener(), this);
        pluginManager.registerEvents(new PlayerArmorStandManipulateListener(), this);
        pluginManager.registerEvents(new PlayerDamageListener(), this);
        pluginManager.registerEvents(new PlayerSwapHandItemsListener(), this);
        pluginManager.registerEvents(titanManager, this);

        for (Items item : Items.values()) {
            pluginManager.registerEvents(item.getItem(), this);
        }
    }

}
