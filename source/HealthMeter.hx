package;

import flixel.FlxSprite;

class HealthMeter extends FlxSprite
{
    public function new(X:Int, Y:Int, level:Int)
    {
        // X,Y: Starting coordinates
        super(X, Y);
        // Make the meter
        makeGraphic(level, Std.int(Reg.TILE_SIZE/2)-2, 0xffa81e1e);
    }
}
