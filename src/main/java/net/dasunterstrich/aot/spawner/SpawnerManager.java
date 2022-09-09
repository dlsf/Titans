package net.dasunterstrich.aot.spawner;

import net.dasunterstrich.aot.AttackOnTitan;
import net.dasunterstrich.aot.configuration.ConfigFile;
import net.dasunterstrich.aot.configuration.ConfigurationProvider;
import net.dasunterstrich.aot.configuration.types.MainConfig;
import net.dasunterstrich.aot.titans.TitanManager;
import net.dasunterstrich.aot.utils.RandomInterval;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.NamespacedKey;
import org.bukkit.persistence.PersistentDataType;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadLocalRandom;

public class SpawnerManager {

    private final NamespacedKey key = new NamespacedKey(AttackOnTitan.getPlugin(AttackOnTitan.class), "isTitan");
    private final TitanManager titanManager;
    private final ConfigFile config;
    private final Map<Integer, Spawner> spawners = new HashMap<>();
    private final Map<Spawner, Long> nextSpawningTimes = new ConcurrentHashMap<>();
    private final double activationRangeSquared;

    public SpawnerManager(JavaPlugin plugin, TitanManager titanManager) {
        this.titanManager = titanManager;
        this.activationRangeSquared = Math.pow(ConfigurationProvider.getInstance().getDouble(MainConfig.SPAWNER_ACTIVATION_RANGE), 2);

        this.config = new ConfigFile("spawners.yml", plugin);
        config.save();

        config.getKeys(false).forEach(key -> {
            var configurationSection = config.getConfigurationSection(key);
            var world = configurationSection.getString("world");
            var x = configurationSection.getInt("x");
            var y = configurationSection.getInt("y");
            var z = configurationSection.getInt("z");
            var interval = new RandomInterval(configurationSection.getInt("interval.min"), configurationSection.getInt("interval.max"));
            var minAmount = configurationSection.getInt("minSpawnAmount");
            var maxAmount = configurationSection.getInt("maxSpawnAmount");

            var spawner = new Spawner(world, x, y, z, interval, minAmount, maxAmount);
            spawners.put(Integer.valueOf(key), spawner);
        });

        startScheduler();
    }

    private void startScheduler() {
        spawners.values().forEach(spawner -> {
            nextSpawningTimes.put(spawner, System.currentTimeMillis() + (spawner.getInterval().getNextInterval() * 50L));
        });

        Bukkit.getScheduler().scheduleSyncRepeatingTask(AttackOnTitan.getPlugin(AttackOnTitan.class), () -> {
            nextSpawningTimes.forEach((spawner, time) -> {
                if (time > System.currentTimeMillis()) {
                    return;
                }

                if (!spawners.containsValue(spawner)) {
                    nextSpawningTimes.remove(spawner);
                    return;
                }

                spawn(spawner);
                nextSpawningTimes.put(spawner, System.currentTimeMillis() + (spawner.getInterval().getNextInterval() * 50L));
            });
        }, 0L, 20L);
    }

    private void spawn(Spawner spawner) {
        var spawnerLocation = new Location(Bukkit.getWorld(spawner.getWorld()), spawner.getX(), spawner.getY(), spawner.getZ());
        var spawnAmount = ThreadLocalRandom.current().nextInt(spawner.getMinSpawnAmount(), spawner.getMaxSpawnAmount() + 1);

        if (spawnerLocation.getWorld().getPlayers().stream().noneMatch(player -> player.getLocation().distanceSquared(spawnerLocation) <= activationRangeSquared)) {
            return;
        }

        var nearbyEntities = spawnerLocation.getWorld().getNearbyEntities(spawnerLocation, 20, 10, 20, entity -> entity.getPersistentDataContainer().has(key, PersistentDataType.STRING));
        var nearbyEntityCount = nearbyEntities.size() / 2;
        if (nearbyEntityCount >= ConfigurationProvider.getInstance().getInt(MainConfig.SPAWNER_MAX_TITAN_COUNT)) {
            return;
        }

        for (int i = 0; i < spawnAmount; i++) {
            var location = spawnerLocation.clone().add(ThreadLocalRandom.current().nextInt(-5, 5), 1, ThreadLocalRandom.current().nextInt(-5, 5));
            titanManager.spawn(location);
        }
    }

    public void addSpawner(Location location, RandomInterval interval, int minAmount, int maxAmount) {
        var spawner = new Spawner(location.getWorld().getName(), location.getBlockX(), location.getBlockY(), location.getBlockZ(), interval, minAmount, maxAmount);
        var id = getNextID();

        config.set(String.valueOf(id), spawner);
        config.save();

        spawners.put(id, spawner);
    }

    public void remove(int index) {
        config.set(String.valueOf(index), null);
        config.save();

        spawners.remove(index);
    }

    private int getNextID() {
        return config.getKeys(false).stream()
                .mapToInt(Integer::parseInt)
                .max().orElse(-1) + 1;
    }

    public Map<Integer, Spawner> getSpawner() {
        return spawners;
    }

}
