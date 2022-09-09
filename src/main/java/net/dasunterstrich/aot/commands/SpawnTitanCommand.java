package net.dasunterstrich.aot.commands;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.titans.TitanManager;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;

public class SpawnTitanCommand implements CommandExecutor {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final TitanManager titanManager;

    public SpawnTitanCommand(TitanManager titanManager) {
        this.titanManager = titanManager;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!(sender instanceof Player player)) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PLAYER));
            return false;
        }

        if (!player.hasPermission("aot.spawntitan")) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PERMISSIONS));
            return false;
        }

        titanManager.spawn(player.getLocation());
        return true;
    }

}
