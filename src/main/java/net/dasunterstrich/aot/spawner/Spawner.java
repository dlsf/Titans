package net.dasunterstrich.aot.spawner;

import net.dasunterstrich.aot.utils.RandomInterval;

public class Spawner {

    private String world;
    private int x;
    private int y;
    private int z;
    private RandomInterval interval;
    private int minSpawnAmount;
    private int maxSpawnAmount;

    public Spawner(String world, int x, int y, int z, RandomInterval interval, int minSpawnAmount, int maxSpawnAmount) {
        this.world = world;
        this.x = x;
        this.y = y;
        this.z = z;
        this.interval = interval;
        this.minSpawnAmount = minSpawnAmount;
        this.maxSpawnAmount = maxSpawnAmount;
    }

    public String getWorld() {
        return world;
    }

    public void setWorld(String world) {
        this.world = world;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getZ() {
        return z;
    }

    public void setZ(int z) {
        this.z = z;
    }

    public RandomInterval getInterval() {
        return interval;
    }

    public void setInterval(RandomInterval interval) {
        this.interval = interval;
    }

    public int getMinSpawnAmount() {
        return minSpawnAmount;
    }

    public void setMinSpawnAmount(int minSpawnAmount) {
        this.minSpawnAmount = minSpawnAmount;
    }

    public int getMaxSpawnAmount() {
        return maxSpawnAmount;
    }

    public void setMaxSpawnAmount(int maxSpawnAmount) {
        this.maxSpawnAmount = maxSpawnAmount;
    }

}
