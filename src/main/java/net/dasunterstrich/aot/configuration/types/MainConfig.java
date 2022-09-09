package net.dasunterstrich.aot.configuration.types;

import org.bukkit.ChatColor;

import java.util.List;

/**
 * The main config the plugin.
 * Contains general values that are not send in chat.
 */
public enum MainConfig implements IConfiguration {

    SHUTDOWN_REMOVE_TITANS("remove-titans-on-shutdown", true),
    MIN_SWORD_DAMAGE("min-sword-damage", 15),
    MAX_SWORD_DAMAGE("max-sword-damage", 100),
    SPAWNER_ACTIVATION_RANGE("spawner.activation-range", 50.0),
    SPAWNER_MAX_TITAN_COUNT("spawner.max-titan-count", 5),
    TITAN_DAMAGE("titan.damage", 15),
    TITAN_HEALTH("titan.health", 100),
    TITAN_SPAWN_HEIGHT("titan.spawn-height", 6),
    TITAN_MODEL_DATA("titan.model.data", 10000),
    TITAN_DROP_CHANCES("titan.drop-chances", List.of("ROTTEN_FLESH|1|1-3", "GOLDEN_APPLE|5|1-1", "cmd|give %player% dirt %amount%|10|1-2")),
    TITAN_ATTACK_RANGE("titan.attack-range", 3.5),
    TITAN_VIEW_DISTANCE("titan.view-distance", 25.0),
    HOOK_TICK_SPEED("hook.tick-speed-in-ticks", 1),
    HOOK_LIFETIME("hook.lifetime-in-seconds", 3),
    HOOK_SLOW_FALLING_DURATION("hook.slow-falling-duration-in-ticks", 2.5 * 20),
    ITEM_ANTI_PERSONNEL_GEAR_NAME("items.anti-personnel-gear", ChatColor.GOLD + "Anti-Personnel ODM Gear"),
    ITEM_ANTI_PERSONNEL_SHOT_GUNS_NAME("items.anti-personnel-shot-guns", ChatColor.YELLOW + "Anti personnel shot guns"),
    ITEM_PERSONAL_GEAR_NAME("items.personal-gear", ChatColor.GOLD + "ODM Gear"),
    ITEM_STEEL_SWORDS_NAME("items.steel-swords", ChatColor.YELLOW + "Ultra Hard Steel Swords"),
    ITEM_BLACK_FLARE_NAME("items.black-flare", ChatColor.BLACK + "Black Flare Gun"),
    ITEM_GREEN_FLARE_NAME("items.green-flare", ChatColor.GREEN + "Green Flare Gun"),
    ITEM_RED_FLARE_NAME("items.red-flare", ChatColor.RED + "Red Flare Gun"),
    ITEM_YELLOW_FLARE_NAME("items.yellow-flare", ChatColor.YELLOW + "Yellow Flare Gun"),
    MESSAGE_NO_PLAYER("messages.no-player", ChatColor.RED + "Dafür musst du ein Spieler sein!"),
    MESSAGE_NO_PERMISSIONS("messages.no-permissions", ChatColor.RED + "Dazu hast du keine Berechtigung!"),
    MESSAGE_ITEM_WRONG_SYNTAX("messages.wrong-aotitem-syntax", ChatColor.RED + "Bitte verwende /aotitem <Name>"),
    MESSAGE_NO_SUCH_ITEM("messages.no-such-aotitem", ChatColor.RED + "Es gibt leider kein Item mit diesem Namen!"),
    MESSAGE_ITEM_SUCCESS("messages.item-success", ChatColor.GREEN + "Du hast das Item erfolgreich erhalten!"),
    MESSAGE_INVENTORY_FULL("messages.inventory-full", ChatColor.RED + "Dein Inventar ist voll!"),
    MESSAGE_SPAWNER_WRONG_SYNTAX("messages.wrong-aotspawner-syntax", ChatColor.RED + "Bitte verwende /aotspawner <create/delete/list>"),
    MESSAGE_SPAWNER_DELETE_WRONG_SYNTAX("messages.wrong-aotspawner-delete-syntax", ChatColor.RED + "Bitte verwende /aotspawner delete <ID>"),
    MESSAGE_SPAWNER_CREATE_WRONG_SYNTAX("messages.wrong-aotspawner-create-syntax", ChatColor.RED + "Bitte verwende /aotspawner create <x> <y> <z> <min. Intervall> <max. Interval> <min. Anzahl> <max. Anzahl>"),
    MESSAGE_NO_SPAWNERS("messages.no-spawners", ChatColor.GREEN + "Es gibt keine Spawner!"),
    MESSAGE_SPAWNER_DELETED("messages.spawner-deleted", ChatColor.GREEN + "Der Spawner wurde erfolgreich gelöscht!"),
    MESSAGE_SPAWNER_CREATED("messages.spawner-created", ChatColor.GREEN + "Der Spawner wurde erfolgreich erstellt!");

    private final String configKey;
    private final Object defaultValue;

    /**
     * The default constructor.
     *
     * @param configKey    The key of this config entry.
     * @param defaultValue The default value of this config entry.
     */
    MainConfig(String configKey, Object defaultValue) {
        this.configKey = configKey;
        this.defaultValue = defaultValue;
    }

    /**
     * The key of this config entry used in the config file.
     *
     * @return The key of this config entry.
     */
    @Override
    public String getConfigKey() {
        return configKey;
    }

    /**
     * The default value of this config option.
     * May be supported by the serialization library.
     *
     * @return The default value of this config entry.
     */
    @Override
    public Object getDefaultValue() {
        return defaultValue;
    }

}