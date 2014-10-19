-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

class: Timer
{
	Timer		= function( ... )
		return setTimer( ... )( this );
	end;
	
	_Timer		= function()
		this.Kill();
	end;
	
	Kill		= function()
		return killTimer( this );
	end;
	
	GetDetails	= function()
		return getTimerDetails( this );
	end;
};