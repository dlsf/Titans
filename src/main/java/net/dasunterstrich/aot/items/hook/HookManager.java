package net.dasunterstrich.aot.items.hook;

import net.dasunterstrich.aot.AttackOnTitan;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

public class HookManager {

    private final ConfigurationProvider configurationProvider = ConfigurationProvider.getInstance();
    private final static HookManager instance;
    private final Map<UUID, Hook> activeHooks = new ConcurrentHashMap<>();
    private final int tickSpeed = configurationProvider.getInt(MainConfig.HOOK_TICK_SPEED);
    private final int maxTicks = (int) ((configurationProvider.getDouble(MainConfig.HOOK_LIFETIME) * 20) / tickSpeed);

    static {
        instance = new HookManager();
    }

    private HookManager() {
        // No logic required
    }

    public void startTask() {
        Bukkit.getScheduler().scheduleSyncRepeatingTask(AttackOnTitan.getPlugin(AttackOnTitan.class), this::tick, 0L, tickSpeed);
    }

    private void tick() {
        activeHooks.entrySet().forEach(entry -> {
            if (entry.getKey() == null || entry.getValue() == null) {
                return;
            }

            var player = Bukkit.getPlayer(entry.getKey());
            var hook = entry.getValue();

            hook.tick();
            
            if (hook.getTicks() >= maxTicks) {
                removeHook(player);
            }
        });
    }

    public void fireHook(Player player) {
        var hook = new Hook(player);
        hook.spawn();

        activeHooks.put(player.getUniqueId(), hook);
    }

    public void removeHook(Player player) {
        if (!hasHook(player)) {
            return;
        }

        var hook = activeHooks.get(player.getUniqueId());
        hook.despawn();

        activeHooks.remove(player.getUniqueId());
    }

    public boolean hasHook(Player player) {
        return activeHooks.containsKey(player.getUniqueId());
    }

    public static HookManager getInstance() {
        return instance;
    }

}
