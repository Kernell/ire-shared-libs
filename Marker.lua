-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

class: Marker ( Element )
{
	Marker		= function( Position, Type, Size, Color, VisibleTo )
		Position 	= Position or new. Vector3();
		Type		= Type or "checkpoint";
		Size		= Size or 4.0;
		Color		= Color or new. Color( 255, 0, 0, 255 );
		VisibleTo	= VisibleTo or root;
		
		return createMarker( Position.X, Position.Y, Position.Z, Type, Size, Color.R, Color.G, Color.B, Color.A, VisibleTo )( this );
	end;
	
	_Marker	= function()
		return destroyElement( this );
	end;
	
	GetColor	= function()
		return new. Color( getMarkerColor( this ) );
	end;

	GetIcon		= function()
		return getMarkerIcon( this );
	end;
	
	GetSize		= function()
		return getMarkerSize( this );
	end;

	GetTarget	= function()
		return new. Vector3( getMarkerTarget( this ) );
	end;

	GetType		= function()
		return getMarkerType( this );
	end;

	SetColor	= function( Color )
		return setMarkerColor( this, Color.R, Color.G, Color.B, Color.A );
	end;

	SetIcon		= function( Icon )
		return setMarkerIcon( this, Icon );
	end;

	SetSize		= function( Size )
		return setMarkerSize( this, Size );
	end;

	SetTarget	= function( Position )
		Position = Position or new. Vector3();
		
		return setMarkerTarget( this, Position.X, Position.Y, Position.Z );
	end;

	SetType		= function( Type )
		return setMarkerType( this, Type );
	end;
};