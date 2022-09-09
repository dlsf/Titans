package net.dasunterstrich.aot.commands;

import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.items.Items;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabExecutor;
import org.bukkit.entity.Player;

import java.util.Arrays;
import java.util.List;

public class AotItemCommand implements TabExecutor {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();

    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!(sender instanceof Player player)) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PLAYER));
            return false;
        }

        if (!player.hasPermission("aot.giveitem")) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_PERMISSIONS));
            return false;
        }

        if (args.length == 0) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_ITEM_WRONG_SYNTAX));
            return false;
        }

        var itemOptional = Arrays.stream(Items.values())
                .filter(item -> item.getItem().getName().equalsIgnoreCase(args[0]))
                .findAny();

        if (itemOptional.isEmpty()) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_NO_SUCH_ITEM));
            return false;
        }

        var itemsLeft = player.getInventory().addItem(itemOptional.get().getItem().getItemStack());
        if (itemsLeft.isEmpty()) {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_ITEM_SUCCESS));
        } else {
            sender.sendMessage(configurationProvider.getString(MainConfig.MESSAGE_INVENTORY_FULL));
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

        return Arrays.stream(Items.values()).map(item -> item.getItem().getName()).toList();
    }

}
