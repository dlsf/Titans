package net.dasunterstrich.aot.items;

public abstract class TickingItem extends Item {

    public long tickSpeed;

    public TickingItem(String name, long tickSpeed) {
        super(name);

        this.tickSpeed = tickSpeed;
    }

    public abstract void tick();

}
