-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

ASSERT( CLIENT, "This script is client-side only" );

class. Player : Ped
{
	GetName				= function()
		return getPlayerName( this );
	end;
	
	GetPing				= function()
		return getPlayerPing( this );
	end;
	
	GetTeam				= function()
		return getPlayerTeam( this );
	end;
	
	GetNametagText		= function()
		return getPlayerNametagText( this );
	end;
	
	GetNametagColor		= function()
		return getPlayerNametagColor( this );
	end;
	
	SetNametagShowing	= function()
		return setPlayerNametagShowing( this );
	end;
};
