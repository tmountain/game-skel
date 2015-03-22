package;

import flixel.FlxSprite;

class Enemy extends FlxSprite
{
    /**
     * How big the tiiles of the tilemap are.
     */
    private static var TILE_SIZE:Int = Reg.TILE_SIZE;

    public function new(X:Int, Y:Int)
    {
        // X,Y: Starting coordinates
        super(X, Y);
        // Make the enemy graphic
        makeGraphic(TILE_SIZE, TILE_SIZE, 0xff9400D3);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

}
