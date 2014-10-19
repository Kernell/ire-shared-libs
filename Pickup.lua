-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

class: Pickup ( Element )
{
	Pickup		= function( Position, ... )
		Position = Position or new. Vector3();
		
		return createPickup( Position.X, Position.Y, Position.Z, ... )( this );
	end;
	
	_Pickup	= function()
		return destroyElement( this );
	end;
};