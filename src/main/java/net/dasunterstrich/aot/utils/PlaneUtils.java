package net.dasunterstrich.aot.utils;

import org.bukkit.Location;

public class PlaneUtils {

    public static boolean isOnSameSideOfPlane(Location planeLocation, Location toCheck) {
        var n = planeLocation.getDirection();
        var d = n.getX() * planeLocation.getX() + n.getY() * planeLocation.getY() + n.getZ() * planeLocation.getZ();

        // If ax + by + cz - d > 0, it's on the opposite side
        return n.getX() * toCheck.getX() + n.getY() * toCheck.getY() + n.getZ() * toCheck.getZ() - d < 0;
    }

}
