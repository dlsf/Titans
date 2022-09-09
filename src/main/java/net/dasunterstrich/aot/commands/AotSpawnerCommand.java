package net.dasunterstrich.aot.commands;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.spawner.SpawnerManager;
import net.dasunterstrich.aot.utils.RandomInterval;
import org.bukkit.Location;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabExecutor;
import org.bukkit.entity.Player;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class AotSpawnerCommand implements TabExecutor {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final SpawnerManager spawnerManager;

    public AotSpawnerCommand(SpawnerManager spawnerManager) {
        this.spawnerManager = spawnerManager;
    }

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!(sender instanceof Player player)) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PLAYER));
            return false;
        }

        if (!player.hasPermission("aot.spawner")) {
            player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PERMISSIONS));
            return false;
        }

        if (args.length == 0) {
            player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_WRONG_SYNTAX));
            return false;
        }

        switch (args[0].toLowerCase()) {
            case "create" -> {
                try {
                    var x = Integer.parseInt(args[1]);
                    var y = Integer.parseInt(args[2]);
                    var z = Integer.parseInt(args[3]);
                    var interval = new RandomInterval(Integer.parseInt(args[4]), Integer.parseInt(args[5]));
                    var minAmount = Integer.parseInt(args[6]);
                    var maxAmount = Integer.parseInt(args[7]);

                    spawnerManager.addSpawner(new Location(player.getWorld(), x, y, z), interval, minAmount, maxAmount);
                    player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_CREATED));
                } catch (IndexOutOfBoundsException | NumberFormatException exception) {
                    player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_CREATE_WRONG_SYNTAX));
                }
            }

            case "delete" -> {
                try {
                    spawnerManager.remove(Integer.parseInt(args[1]));
                    player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_DELETED));
                } catch(IndexOutOfBoundsException | NumberFormatException exception) {
                    player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_DELETE_WRONG_SYNTAX));
                }
            }

            case "list" -> {
                var spawners = spawnerManager.getSpawner();
                if (spawners.isEmpty()) {
                    player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_SPAWNERS));
                    return false;
                }

                spawners.entrySet().stream()
                        .map(entry -> entry.getKey() + ": " + entry.getValue().getWorld() + " | x=" + entry.getValue().getX() + ", y=" + entry.getValue().getY() + ", z=" + entry.getValue().getZ())
                        .forEach(player::sendMessage);
            }

            default -> player.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_SPAWNER_WRONG_SYNTAX));
        }

        return true;
    }

    @Override
    public List<String> onTabComplete(CommandSender sender, Command command, String label, String[] args) {
        if (args.length > 1) {
            return List.of();
        }

        if (!sender.hasPermission("aot.spawntitan")) {
            return List.of();
        }

        return List.of("create", "delete", "list");
    }

}
