-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

enum "eBlipSprite"
{
    BLIP_SPRITE_NONE = 0,
    'BLIP_SPRITE_BORDER',
    'BLIP_SPRITE_CENTRE',
    'BLIP_SPRITE_MAP_HERE',
    'BLIP_SPRITE_NORTH',
    'BLIP_SPRITE_AIRYARD',
    'BLIP_SPRITE_GUN',
    'BLIP_SPRITE_BARBERS',
    'BLIP_SPRITE_BIG_SMOKE',
    'BLIP_SPRITE_BOATYARD',
    'BLIP_SPRITE_BURGERSHOT',
    'BLIP_SPRITE_BULLDOZER',
    'BLIP_SPRITE_CAT_PINK',
    'BLIP_SPRITE_CESAR',
    'BLIP_SPRITE_CHICKEN',
    'BLIP_SPRITE_CJ',
    'BLIP_SPRITE_CRASH1',
    'BLIP_SPRITE_DINER',
    'BLIP_SPRITE_EMMETGUN',
    'BLIP_SPRITE_ENEMYATTACK',
    'BLIP_SPRITE_FIRE',
    'BLIP_SPRITE_GIRLFRIEND',
    'BLIP_SPRITE_HOSPITAL',
    'BLIP_SPRITE_LOCO',
    'BLIP_SPRITE_MADDOG',
    'BLIP_SPRITE_MAFIA',
    'BLIP_SPRITE_MCSTRAP',
    'BLIP_SPRITE_MOD_GARAGE',
    'BLIP_SPRITE_OGLOC',
    'BLIP_SPRITE_PIZZA',
    'BLIP_SPRITE_POLICE',
    'BLIP_SPRITE_PROPERTY_GREEN',
    'BLIP_SPRITE_PROPERTY_RED',
    'BLIP_SPRITE_RACE',
    'BLIP_SPRITE_RYDER',
    'BLIP_SPRITE_SAVEHOUSE',
    'BLIP_SPRITE_SCHOOL',
    'BLIP_SPRITE_MYSTERY',
    'BLIP_SPRITE_SWEET',
    'BLIP_SPRITE_TATTOO',
    'BLIP_SPRITE_TRUTH',
    'BLIP_SPRITE_WAYPOINT',
    'BLIP_SPRITE_TORENO_RANCH',
    'BLIP_SPRITE_TRIADS',
    'BLIP_SPRITE_TRIADS_CASINO',
    'BLIP_SPRITE_TSHIRT',
    'BLIP_SPRITE_WOOZIE',
    'BLIP_SPRITE_ZERO',
    'BLIP_SPRITE_DATE_DISCO',
    'BLIP_SPRITE_DATE_DRINK',
    'BLIP_SPRITE_DATE_FOOD',
    'BLIP_SPRITE_TRUCK',
    'BLIP_SPRITE_CASH',
    'BLIP_SPRITE_FLAG',
    'BLIP_SPRITE_GYM',
    'BLIP_SPRITE_IMPOUND',
    'BLIP_SPRITE_RUNWAY_LIGHT',
    'BLIP_SPRITE_RUNWAY',
    'BLIP_SPRITE_GANG_B',
    'BLIP_SPRITE_GANG_P',
    'BLIP_SPRITE_GANG_Y',
    'BLIP_SPRITE_GANG_N',
    'BLIP_SPRITE_GANG_G',
    'BLIP_SPRITE_SPRAY'
};

class. Blip : Element
{
	Blip		= function( pTarget, ... )
		pTarget = pTarget or new. Vector3();
		
		local pElement		= NULL;
		
		if classname( pTarget ) == "Vector3" then
			pElement		= createBlip( pTarget.X, pTarget.Y, pTarget.Z, ... );
		elseif isElement( pTarget ) then
			pElement		= createBlipAttachedTo( pTarget, ... );
		else
			error( "Bad argument #1 to 'CBlip (wanted 'object', got '" + typeof( vecPosition ) + "')'", 2 );
		end
		
		pElement( this );
		
		return pElement;
	end;
	
	_Blip		= function()
		return destroyElement( this );
	end;
	
	GetColor	= function()
		return new. Color( getBlipColor( this ) );
	end;
	
	GetIcon				= function()
		return getBlipIcon( this );
	end;
	
	GetSize				= function()
		return getBlipSize( this );
	end;
	
	GetOrdering			= function()
		return getBlipOrdering( this );
	end;
	
	GetVisibleDistance	= function()
		return getBlipVisibleDistance( this );
	end;
	
	SetColor			= function( pColor )
		return setBlipColor( this, pColor.R, pColor.G, pColor.B, pColor.A );
	end;
	
	SetIcon				= function( eBlipSprite )
		return setBlipIcon( this, eBlipSprite );
	end;
	
	SetSize				= function( Size )
		return setBlipSize( this, Size );
	end;
	
	SetOrdering			= function( Ordering )
		return setBlipOrdering( this, Ordering );
	end;
	
	SetVisibleDistance	= function( Distance )
		return setBlipVisibleDistance( this, Distance );
	end;
};