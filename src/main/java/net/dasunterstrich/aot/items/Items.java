package net.dasunterstrich.aot.items;

import net.dasunterstrich.aot.items.flares.BlackFlareGun;
import net.dasunterstrich.aot.items.flares.GreenFlareGun;
import net.dasunterstrich.aot.items.flares.RedFlareGun;
import net.dasunterstrich.aot.items.flares.YellowFlareGun;
import org.bukkit.entity.Player;

import java.util.Set;

public enum Items {

    ANTI_PERSONNEL_GEAR(new AntiPersonnelGear()),
    PERSONAL_GEAR(new PersonalGear()),
    RED_FLARE_GUN(new RedFlareGun()),
    YELLOW_FLARE_GUN(new YellowFlareGun()),
    GREEN_FLARE_GUN(new GreenFlareGun()),
    BLACK_FLARE_GUN(new BlackFlareGun()),
    SHOT_GUNS(new AntiPersonnelShotGuns()),
    STEEL_SWORD(new SteelSwords());

    private final Item item;

    Items(Item item) {
        this.item = item;
    }

    public Item getItem() {
        return item;
    }

    public static Set<Items> getFlareGuns() {
        return Set.of(RED_FLARE_GUN, YELLOW_FLARE_GUN, GREEN_FLARE_GUN, BLACK_FLARE_GUN);
    }

    public static boolean hasAOTItemEquiped(Player player) {
        for (Items item : values()) {
            var itemStack = item.getItem().getItemStack();
            var handItem = player.getInventory().getItemInMainHand();
            var offhandItem = player.getInventory().getItemInOffHand();

            if (itemStack.equals(offhandItem) || itemStack.equals(handItem)) {
                return true;
            }
        }

        return false;
    }

}
