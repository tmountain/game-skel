package;

import flixel.FlxSprite;

class EnergyMeter extends FlxSprite
{
    public function new(X:Int, Y:Int, level:Int)
    {
        // X,Y: Starting coordinates
        super(X, Y);
        // Make the meter
        makeGraphic(40, 6, 0xff001adb);
    }
}
