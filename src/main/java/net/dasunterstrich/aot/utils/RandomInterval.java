package net.dasunterstrich.aot.utils;

import java.util.concurrent.ThreadLocalRandom;

public class RandomInterval {

    private int min;
    private int max;

    public RandomInterval(int min, int max) {
        this.min = min;
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getNextInterval() {
        return ThreadLocalRandom.current().nextInt(min, max + 1);
    }

}
