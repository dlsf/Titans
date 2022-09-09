package net.dasunterstrich.aot.utils;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

public class CooldownProvider<T> {

    private final Map<T, Duration> cooldownTimes = new HashMap<>();
    private final Duration duration;

    public CooldownProvider(Duration duration) {
        this.duration = duration;
    }

    public boolean isOnCooldown(T t) {
        return cooldownTimes.containsKey(t) && cooldownTimes.get(t).toMillis() > System.currentTimeMillis();
    }

    public Duration getRemainingTime(T t) {
        if (!isOnCooldown(t)) return Duration.ZERO;

        return cooldownTimes.get(t).minusMillis(System.currentTimeMillis());
    }

    public void applyCooldown(T t) {
        cooldownTimes.put(t, duration.plusMillis(System.currentTimeMillis()));
    }

    public static <T> CooldownProvider<T> newInstance(Duration duration) {
        return new CooldownProvider<>(duration);
    }

}