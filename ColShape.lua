-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

local aTypes =
{
	Circle		= true;
	Cuboid		= true;
	Rectangle	= true;
	Sphere		= true;
	Tube		= true;
	Polygon		= true;
};

class: ColShape ( Element )
{
	ColShape		= function( sType, ... )
		local pElement = _G[ "createCol" + sType ]( ... );
		
		pElement( this );
		
		return pElement;
	end;
	
	_ColShape		= function()
		return destroyElement( this );
	end;
};