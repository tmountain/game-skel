package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;

/**
  * Inherits from FlxState and provides base functionality
  * for things like the HUD, etc.
  */
class BaseState extends FlxState
{
    // holds a reference to the player1 for inspecting/adjusting player1 state
    public var player1:Player;
    // health meter frame and drawable
    private var healthMeterFrame1:FlxSprite;
    private var healthMeter1:HealthMeter;
    // energy meter
    private var energyMeterFrame1:FlxSprite;
    private var energyMeter1:EnergyMeter;
    // avatar
    public var avatar1:FlxSprite;
    // the hud locks things in place and prevents scrolling
    private var hud:FlxSpriteGroup;

    override public function create():Void
    {
        hud = new FlxSpriteGroup();
        add(hud);
        buildHUD();

        hud.forEach(function(s:FlxSprite) {
            // this makes sure the HUD doesn't move with the camera
            s.scrollFactor.set(0, 0);
            // we only want the HUD to display on the main camera
            s.cameras = [FlxG.camera];
        });
        super.create();
    }

    private function buildHUD()
    {
        // this represents half the size of a standard tile
        // it's used for aligning the HUD elements for player1 below
        var tileD2:Int = Std.int(Reg.TILE_SIZE / 2);

        // this block positions the hud for player1 relative to the top-left
        // hand corner of the screen
        this.avatar1 = new FlxSprite(tileD2, tileD2, IMG.AVATAR);
        this.healthMeterFrame1 = new FlxSprite(Reg.TILE_SIZE+tileD2 + 1, tileD2, IMG.METER);
        this.healthMeter1 = new HealthMeter(Reg.TILE_SIZE+tileD2 + 2, tileD2 + 1, 51);
        this.energyMeterFrame1 = new FlxSprite(Reg.TILE_SIZE+tileD2 + 1, tileD2*2, IMG.METER);
        this.energyMeter1 = new EnergyMeter(Reg.TILE_SIZE+tileD2 + 2, tileD2*2 + 1, 30);

        // something here to draw the health meter red line
        // something here to draw the health meter blue line

        hud.add(avatar1);
        hud.add(healthMeterFrame1);
        hud.add(healthMeter1);
        hud.add(energyMeterFrame1);
        hud.add(energyMeter1);
    }

    /**
     * Function that is called when this state is destroyed - you might want to
     * consider setting all objects this state uses to null to help garbage collection.
     */
    override public function destroy():Void
    {
        super.destroy();
    }

    /**
     * Function that is called once every frame.
     */
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
