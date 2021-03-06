package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * Handles PlayState
 */
class PlayState extends BaseState
{
    public var player:Player;
    // only allows one enemy
    public var enemy:Enemy;
    private var _level:TiledLevel;

    override public function create():Void
    {
        FlxG.mouse.visible = false;
        bgColor = 0xFF18A068;

        // Load the level's tilemaps
        _level = new TiledLevel("assets/data/map.tmx");

        // Add tilemaps
        add(_level.backgroundTiles);

        // Add tilemaps
        add(_level.foregroundTiles);

        // Load player and objects of the Tiled map
        _level.loadObjects(this);

        // call the parent constructor
        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Collide with foreground tile layer
        if (_level.collideWithLevel(player))
        {
            // Resetting the movement flag if the player hits the wall
            // is crucial, otherwise you can get stuck in the wall
            player.moveToNextTile = false;
        }
    }

    override public function destroy():Void
    {
        super.destroy();
        player = null;
        _level = null;
    }
}
