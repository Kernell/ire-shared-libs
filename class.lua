-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

local Protected	=
{
	__type			= true;
	__name			= true;
	__class 		= true;
	__base			= true;
	__index 		= true;
	__property		= true;
	__properties	= true;
	__new			= true;
	__fenv			= true;
};

local fenvs = {};

local _setfenv = setfenv;
function setfenv( f, env )
	fenvs[ f ] = env;
	
	return env and _setfenv( f, env );
end

function getfenv( f )
	return fenvs[ f ];
end

class			= 
{
	__newindex	= function( this )
		return NULL;
	end;
	
	__index		= function( this, Name )
		return setmetatable(
			{},
			{
				__index = function( t, BaseName )
					local BaseClass = _G[ BaseName ];
					
					if BaseClass == NULL then
						error( "The type or namespace name '" + BaseName + "' could not be found", 2 );
					end
					
					local Class	= this:Create( Name, BaseClass );
					
					return function( t, Values )
						this:SetValues( Class, Values );
					end;
				end;
				
				__call = function( t, Values )
					local Class	= this:Create( Name );
		
					this:SetValues( Class, Values );
				end;
			}
		);
	end;
	
	__call		= function( this )
		return NULL;
	end;
	
	Create		= function( this, Name, BaseClass )
		local CClass	=
		{
			[ Name ]	= function() end;
			
			__call		= function( self, ... )
				local Name = getmetatable( self ).__name;
				
				local vResult = self[ Name ]( ... )
				
				return vResult == NULL and self or vResult;
			end;
			
			__add		= function( self, op )
				if self.Add then
					return self.Add( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '+' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__sub		= function( self, op )
				if self.Sub then
					return self.Sub( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '-' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__mul		= function( self, op )
				if self.Mul then
					return self.Mul( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '*' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__div		= function( self, op )
				if self.Div then
					return self.Div( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '/' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__pow		= function( self, op )
				if self.Pow then
					return self.Pow( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '^' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__mod		= function( self, op )
				if self.Mod then
					return self.Mod( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '%' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__eq		= function( self, op )
				if self.Equality then
					return self.Equality( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '==' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__concat	= function( self, op )
				if self.Concat then
					return self.Concat( op );
				end
				
				local Types =
				{
					{ typeof( self ), self },
					{ typeof( op ), op }
				};
				
				for i, Type in ipairs( Types ) do
					if Type[ 1 ] == "object" then
						Types[ i ][ 1 ] = classname( Type[ 2 ] );
					end
				end
				
				error( "Operator '+' cannot be applied to operands of type '" + Types[ 1 ][ 1 ] + "' and '" + Types[ 2 ][ 1 ] + "'", 2 );
			end;
			
			__len		= function( self )
				if self.Length then
					return self.Length();
				end
				
				error( "Operator '#' cannot be applied to operands of type '" + classname( self ) + "'", 2 );
			end;
		};
		
		CClass.__class 			= CClass;
		
		function CClass:__tostring()
			if rawget( self, "ToString" ) then
				return self.ToString();
			end
			
			rawset( CClass, "__tostring", NULL );
			
			local Result = tostring( self );
			
			rawset( CClass, "__tostring", CClass.__tostring__ );
			
			return Result;
		end;
		
		CClass.__tostring__ 	= CClass.__tostring;
		
		function CClass:__index( KeyName )
			local Result = rawget( self, KeyName );
			
			if type( Result ) == "nil" then
				Result = CClass[ KeyName ];
			end
			
			if type( Result ) == "function" then
				setfenv( Result, self.__fenv );
				
				return Result;
			end
			
			if type( Result ) == "table" and Result.__type == "event" then
				local Event =
				{
					__name = KeyName[ 1 ]:lower() + KeyName:sub( 2, -1 );
					
					__call = function( ttt, ... )
						triggerEvent( ttt.__name, self.this, ... );
					end;
				};
				
				Event.Add	= function( delegate, getPropagated, priority )
					local fenv = getfenv( delegate );
					
					Event[ delegate ] = function( ... )
						setfenv( delegate, fenv );
						
						local e =
						{
							Client	= client;
							Name	= eventName;
							Cancel	= cancelEvent;
						};
						
						local c = coroutine.create( delegate );
						
						local result, message = coroutine.resume( c, source, e, ... );
						
						if not result then
							error( tostring( message ), 3 );
						end
					end;
					
					addEventHandler( Event.__name, self.this, Event[ delegate ], getPropagated == NULL or getPropagated, priority or "normal" );
				end;
				
				Event.Remove = function( delegate )
					if Event[ delegate ] then
						removeEventHandler( Event.__name, self.this, Event[ delegate ] );
					end
				end;
				
				return setmetatable( Event, Event );
			end
			
			if type( Result ) ~= "nil" then
				return Result;
			end
			
			local pProperty = CClass.__property;
			
			if pProperty and pProperty[ KeyName ] and pProperty[ KeyName ].get then
				if type( pProperty[ KeyName ].get ) == "function" then
					setfenv( pProperty[ KeyName ].get, self.__fenv );
					
					return pProperty[ KeyName ].get( self );
				end
				
				return pProperty[ KeyName ].get;
			end
			
			return NULL;
		end
		
		function CClass:__newindex( KeyName, vValue )
			local pProperty = CClass.__property;
			
			if pProperty and pProperty[ KeyName ] and type( pProperty[ KeyName ].set ) == "function" then
				setfenv( pProperty[ KeyName ].set, self.__fenv );
				
				pProperty[ KeyName ].set( vValue );
				
				return;
			end
			
			local r = rawget( self, KeyName );
			
			if type( r ) == "table" and r.__type == "event" then
				return NULL;
			end
			
			rawset( self, KeyName, vValue );
		end
		
		function CClass:__gc()
			
		end
		
		local ClassMeta	=
		{
			__type			= "class";
			__name			= Name;
			__property		= {};
			__properties	= {};
			
			__new		= function( Class )
				local Object		=
				{
					__type	= "object";
					__fenv	= {};
				};
				
				local fenv_meta =
				{
					__index		= function( s, k )
						if k == "this" then
							return Object.this;
						end;
						
						return _G[ k ];
					end;
				};
				
				setmetatable( Object.__fenv, fenv_meta );
				
				Object.this	= Object;
				
				setmetatable( Object, Class );
				
				for key, value in pairs( Class.__properties ) do
					Object[ key ] = value;
				end
				
				return Object;
			end;
			
			__call		= function( Class, Object )
				error( "assertion failed", 2 );
			end;
			
			__tostring	= function( Class )
				return typeof( Class ) + ": " + classname( Class );
			end;
		};
		
		ClassMeta.__newindex	= function( Class, key, value )
			if ClassMeta[ key ] ~= NULL then
				ClassMeta[ key ] = value;
				
				return;
			end
			
			error( "A namespace does not directly contain members such as fields or methods", 2 );
		end;
		
		ClassMeta.__index = ClassMeta;
		
		if BaseClass then
			this:Extends( CClass, BaseClass );
		end
		
		setmetatable( CClass, ClassMeta );
		
		_G[ Name ] = CClass;
		
		return CClass;
	end;
	
	Extends		= function( this, Class, Base )
		rawset( Class, "__base", Base );
		
		for key, value in pairs( Base ) do
			if not Protected[ key ] then
				if type( value ) == "function" then
					rawset( Class, key, value );
				elseif type( value ) == "table" and value.__type == "event" then
					rawset( Class, key, value );
				else
					Class.__properties[ key ] = value;
				end
			end
		end
		
		for key, value in pairs( Base.__properties ) do
			if not Protected[ key ] then
				Class.__properties[ key ] = value;
			end
		end
	end;
	
	SetValues	= function( this, Class, Values )
		if Values == NULL then
			error( "assertion failed", 3 );
		end
		
		for key, value in pairs( Values ) do
			if not Protected[ key ] then
				if tonumber( key ) and type( value ) == "table" then
					if value.__static then
						local ClassMeta = getmetatable( Class );
						
						for k, v in pairs( value ) do
							if not Protected[ k ] then
								ClassMeta[ k ] = v;
							end
						end
					elseif value.__property then
						local sKey = value.__property;
						
						Class.__property[ sKey ] = value;
					elseif value.__type == "event" then
						rawset( Class, value.__name, value );
					end
				else
					if type( value ) == "function" then
						rawset( Class, key, value );
					else
						Class.__properties[ key ] = value;
					end
				end
			end
		end
	end;
};

setmetatable( class, class );

new		=
{
	__index		= function( this, Name )
		local Class	= _G[ Name ];
		
		return Class and Class:__new();
	end;
};

setmetatable( new, new );

property	=
{
	__index		= function( this, sName )
		return function( t, Values )
			Values.__property	= sName;
			
			return Values;
		end;
	end;
};

setmetatable( property, property );

event	=
{
	__index		= function( this, name )
		local e =
		{
			__name	= name;
			__type	= "event";
		};
		
		return e;
	end;
};

setmetatable( event, event );

function static( Values )
	Values.__static = true;
	
	return Values;
end

function virtual( CClass )
	return typeof( CClass ) == "class" and { __type = "virtual_class", __class = CClass } or error( "Argument is not a class", 2 );
end

function typeof( void )
	local Type = type( void );
	
	if Type == "table" or Type == "userdata" then
		return void.__type or Type;
	end
	
	return Type; 
end

function classof( void )
	if type( void ) == "table" or type( void ) == "userdata" then
		return void.__class;
	end
	
	return NULL;
end

function classname( void )
	if type( void ) == "table" or type( void ) == "userdata" then
		return void.__name;
	end
	
	return NULL;
end

function delete( pObject )
	if classof( pObject ) then
		if pObject[ "_" + pObject.__name ] then
			pObject[ "_" + pObject.__name ]( pObject );
		end
		
		if type( pObject ) == "table" then
			setmetatable( pObject, NULL );
		else
			UserdataMeta.__gc( pObject );
		end
		
		collectgarbage( "collect" );
		
		return true;
	end
	
	return false;
end