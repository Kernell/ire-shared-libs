-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

class: Object ( Element )
{
	Object			= function( Model, Position, Rotation )
		Position = Position or new. Vector3();
		Rotation = Rotation or new. Vector3();
		
		return createObject( Model, Position.X, Position.Y, Position.Z, Rotation.X, Rotation.Y, Rotation.Z )( this );
	end;
	
	_Object			= function()
		return destroyElement( this );
	end;
	
	Move			= function( Time, Position, Rotation, ... )
		Position = Position or new. Vector3();
		Rotation = Rotation or new. Vector3();
		
		return moveObject( this, Time, Position.X, Position.Y, Position.Z, Rotation.X, Rotation.Y, Rotation.Z, ... );
	end;
	
	Stop			= function()
		return stopObject( this );
	end;
	
	SetScale		= function( Scale )
		return setObjectScale( this, Scale );
	end;
	
	GetScale		= function()
		return getObjectScale( this );
	end;
	
	SetBreakable	= function( Breakable )
		return setObjectBreakable( this, Breakable );
	end;
	
	IsBreakable		= function()
		return isObjectBreakable( this );
	end;
};
