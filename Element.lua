-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

class. Element
{
	Element					= function( ... )
		if not ( { ... } )[ 1 ] then
			error( "Bad argument @ 'createElement' [Expected string at argument 1, got none]", 2 );
		end
		
		local pElement	= createElement( ... );
		
		pElement( this );
		
		return pElement;
	end;
	
	_Element				= function()
		return destroyElement( this );
	end;
	
	Destroy					= function()
		delete ( this );
	end;
	
	AddEvent				= function( sEvent, vFunction, pObject )
		this[ vFunction ]	= function( ... )
			vFunction( pObject or this, ... );
		end;
		
		addEventHandler( sEvent, this, this[ vFunction ] );
	end;

	RemoveEvent				= function( sEvent, vFunction )
		removeEventHandler( sEvent, this, this[ vFunction ] );
		
		this[ vFunction ]	= NULL;
	end;
	
	IsValid					= function()
		return isElement( this );
	end;
	
	GetID					= function()
		return getElementID( this );
	end;
	
	GetType					= function()
		return getElementType( this );
	end;
	
	SetID					= function( ID )
		return setElementID( this, ID );
	end;
	
	GetChild				= function()
		return getElementChild( this );
	end;
	
	GetChilds				= function()
		return getElementChildren( this );
	end;
	
	GetChildsCount			= function()
		return getElementChildrenCount( this );
	end;
	
	GetWithinColShape		= function()
		return getElementsWithinColShape( this );
	end;
	
	IsWithinColShape		= function()
		return isElementWithinColShape( this );
	end;
	
	SetData					= function( DataName, DataValue )
		return setElementData( this, DataName, DataValue );
	end;
	
	GetData					= function( DataName )
		return getElementData( this, DataName );
	end;
	
	RemoveData				= function( DataName )
		return removeElementData( this, DataName );
	end;
	
	AttachTo				= function( pTarget, vecPosOffset, vecRotOffset )
		vecPosOffset	= vecPosOffset or new. Vector3();
		vecRotOffset	= vecRotOffset or new. Vector3();
		
		return attachElements( this, pTarget, vecPosOffset.X, vecPosOffset.Y, vecPosOffset.Z, vecRotOffset.X, vecRotOffset.Y, vecRotOffset.Z );
	end;
	
	Detach					= function( ... )
		return detachElements( this, ... );
	end;
	
	SetAttachedOffsets		= function( vecPosOffset, vecRotOffset )
		vecPosOffset	= vecPosOffset or new. Vector3();
		vecRotOffset	= vecRotOffset or new. Vector3();
		
		return setElementAttachedOffsets( this, vecPosOffset.X, vecPosOffset.Y, vecPosOffset.Z, vecRotOffset.X, vecRotOffset.Y, vecRotOffset.Z );
	end;
	
	IsAttached				= function()
		return isElementAttached( this );
	end;
	
	GetAttachedElements		= function()
		return getAttachedElements( this );
	end;
	
	GetAttachedOffsets		= function()
		return getElementAttachedOffsets( this );
	end;
	
	GetAttachedTo			= function()
		return getElementAttachedTo( this );
	end;
	
	GetColShape				= function()
		return getElementColShape( this );
	end;
	
	GetAlpha				= function()
		return getElementAlpha( this );
	end;
	
	GetDimension			= function()
		return getElementDimension( this );
	end;
	
	GetHealth				= function()
		return getElementHealth( this );
	end;
	
	GetInterior				= function()
		return getElementInterior( this );
	end;
	
	GetParent				= function()
		return getElementParent( this );
	end;
	
	GetPosition				= function()
		return new. Vector3( getElementPosition( this ) );
	end;
	
	GetRotation				= function( sOrder )
		return new. Vector3( getElementRotation( this, sOrder or "default" ) );
	end;
	
	GetVelocity				= function()
		return new. Vector3( getElementVelocity( this ) );
	end;
	
	GetModel				= function()
		return getElementModel( this );
	end;
	
	IsCollisionsEnabled		= function()
		return getElementCollisionsEnabled( this );
	end;
	
	IsDoubleSided			= function()
		return isElementDoubleSided( this );
	end;
	
	IsFrozen				= function()
		return isElementFrozen( this );
	end;
	
	IsInWater				= function()
		return isElementInWater( this );
	end;
	
	IsWithinMarker			= function()
		return isElementWithinMarker( this );
	end;
	
	SetAlpha				= function()
		return setElementAlpha( this );
	end;
	
	SetCollisionsEnabled	= function( Enabled )
		return setElementCollisionsEnabled( this, Enabled );
	end;
	
	SetDoubleSided			= function( Enabled )
		return setElementDoubleSided( this, Enabled );
	end;
	
	SetDimension			= function( Dimension )
		return setElementDimension( this, Dimension );
	end;
	
	SetFrozen				= function( Frozen )
		return setElementFrozen( this, Frozen );
	end;
	
	SetHealth				= function( Health )
		return setElementHealth( this, Health );
	end;
	
	SetInterior				= function( Interior )
		return setElementInterior( this, Interior );
	end;
	
	SetParent				= function( Parent )
		return setElementParent( this, Parent );
	end;
	
	SetPosition				= function( pVector, bWarp )
		pVector	= pVector or new. Vector3();
		
		return setElementPosition( this, pVector.X, pVector.Y, pVector.Z, bWarp == NULL or bWarp );
	end;
	
	SetRotation				= function( pVector, sOrder, bConformPedRotation )
		pVector	= pVector or new. Vector3();
		
		return setElementRotation( this, pVector.X, pVector.Y, pVector.Z, sOrder or "default", bConformPedRotation == true );
	end;
	
	SetRotationAt		= function( vecPosition )
		vecPosition = vecPosition or new. Vector3();
		
		local rotation	= new. Vector3();
		
		local position	= this.GetPosition();
		
		rotation.Z = ( 360.0 - math.deg( math.atan2( vecPosition.X - position.X, vecPosition.Y - position.Y ) ) ) % 360.0;
		
		return this.SetRotation( rotation );
	end;
	
	SetVelocity				= function( pVector )
		pVector	= pVector or new. Vector3();
		
		return setElementVelocity( this, pVector.X, pVector.Y, pVector.Z );
	end;
	
	SetModel				= function( ModelID )
		return setElementModel( this, ModelID );
	end;
	
	-- Client
	
	IsLocal					= function()
		return isElementLocal( this );
	end;
	
	IsOnScreen				= function()
		return isElementOnScreen( this );
	end;
	
	IsStreamable			= function()
		return isElementStreamable( this );
	end;
	
	IsStreamedIn			= function()
		return isElementStreamedIn( this );
	end;
	
	IsCollidableWith		= function()
		return isElementCollidableWith( this );
	end;
	
	GetBoundingBox			= function()
		return getElementBoundingBox( this );
	end;
	
	GetRadius				= function()
		return getElementRadius( this );
	end;
	
	GetMatrix				= function()
		return getElementMatrix( this ); -- TODO: new Matrix( ... );
	end;
	
	SetStreamable			= function( Streamable )
		return setElementStreamable( this, Streamable );
	end;
	
	SetCollidableWith		= function( Element, Enabled )
		return setElementCollidableWith( this, Element, Enabled );
	end;
	
	GetDistanceFromCentreOfMassToBaseOfModel	= function()
		return getElementDistanceFromCentreOfMassToBaseOfModel( this );
	end;
	
	--
	
	GetVelocityAngle		= function()
		local vecVelocity	= this.GetVelocity();
		local vecRotation	= this.GetRotation();
		
		local fSinZ, fCosZ	= -math.sin( math.rad( vecRotation.Z ) ), math.cos( math.rad( vecRotation.Z ) );
		
		local fLength		= vecVelocity.Length();
		
		local fCosX			= fLength == 0.0 and 0.0 or ( fSinZ * vecVelocity.X + fCosZ * vecVelocity.Y ) / fLength;
		
		return math.deg( math.acos( fCosX ) );
	end;
	
	-- Server
	
	Clone					= function( vecPosition, bCloneChildren )
		vecPosition = vecPosition or new. Vector3();
		
		return cloneElement( this, vecPosition.X, vecPosition.Y, vecPosition.Z, (bool)(bCloneChildren) );
	end;
	
	ClearVisible			= function()
		return clearElementVisibleTo( this );
	end;
	
	IsVisibleTo				= function( Element )
		return isElementVisibleTo( this, Element );
	end;
	
	SetVisible				= function( Element, Visible )
		return setElementVisibleTo( this, Element, Visible );
	end;
	
	GetSyncer				= function()
		return getElementSyncer( this );
	end;
	
	GetAllData				= function()
		return getAllElementData( this );
	end;
	
	GetZoneName				= function( CitiesOnly )
		return getElementZoneName( this, CitiesOnly == true );
	end;
};

--

local Type2Class	=
{
	camera			= "ClientCamera";
	console			= "Console";
	player			= "Player";
	ped				= "Ped";
	vehicle			= "Vehicle";
	object			= "Object";
	pickup			= "Pickup";
	marker			= "Marker";
--	colshape		= "ColShape";
	blip			= "Blip";
	radararea		= "RadarArea";
	team			= "Team";
	shader			= "Shader";
	sound			= "Sound";
	Sound			= not CLIENT and "Sound" or NULL;
	texture			= "Texture";
	resource		= "Resource";
	timer			= "Timer";
};

local ElementCache	= {};

UserdataMeta	=
{
	__is_valid	= function( Element )
		return isElement( Element ) or isTimer( Element ) or getResourceName( Element );
	end;
	
	__get_type	= function( Element )
		if isElement( Element ) then
			return getElementType( Element )
		end
		
		if isTimer( Element ) then
			return "timer";
		end
		
		if getResourceName( Element ) then
			return "resource";
		end
		
		return NULL;
	end;
	
	__new		= function( Element )	
		local sClassName	= Type2Class[ UserdataMeta.__get_type( Element ) ];
		
		local Object = new [ _G[ sClassName ] and sClassName or "Element" ];
		
		Object.this = Element;
		
		ElementCache[ Element ] = Object;
		
		return Object;
	end;
	
	__init		= function( Element )
		if UserdataMeta.__is_valid( Element ) then
			UserdataMeta.__new( Element );
		else
			local pInfo			= debug.getinfo( 2 );
			local sModule 		= pInfo.short_src:match( "\(%w+)\.lua" );
			local sAddress1 	= (string)(pInfo.func) - ( type( pInfo.func ) + ": " );
			local sAddress2		= (string)(Element) - ( type( Element ) + ": " );
			
			ASSERT( sModule );
			ASSERT( sAddress1 );
			ASSERT( sAddress2 );
			
			error( "Access violation at address " + sAddress1 + " in module '" + sModule + "'. Read of address " + sAddress2, 3 );
		end
	end;
	
	__call		= function( Element, Object )
		if ElementCache[ Element ] == NULL then
			Object.this = Element;
			
			ElementCache[ Element ] = Object;
		end
		
		return Element;
	end;
	
	__finalize	= function( Element )
		local Object = ElementCache[ Element ];
		
		if Object then
			setmetatable( Object, NULL );
		end
		
		ElementCache[ Element ]	= NULL;
	end;
	
	__gc		= function( Element )
		if type( Element ) ~= "userdata" then
			error( "assertion failed", 3 );
		end
		
		if _DEBUG then
			Debug( "Garbage collector - " + tostring( Element ) );
		end
		
		UserdataMeta.__finalize( Element );
	end;
	
	__index 	= function( Element, key )
		if ElementCache[ Element ] == NULL then
			UserdataMeta.__init( Element );
		end
		
		if ElementCache[ Element ] == NULL then
			error( "assertion failed", 2 );
		end
		
		return ElementCache[ Element ][ key ];
	end;
	
	__newindex = function( Element, key, value )
		if ElementCache[ Element ] == NULL then
			UserdataMeta.__init( Element );
		end
		
		ElementCache[ Element ][ key ] = value;
	end;
};

debug.setmetatable( root, UserdataMeta );