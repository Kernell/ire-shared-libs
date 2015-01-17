-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0


class. Ped : Element
{
	enum "ePedAnimation"
	{
		"PED_ANIMATION_LIB";
		"PED_ANIMATION_NAME";
		"PED_ANIMATION_TIME";
		"PED_ANIMATION_LOOP";
		"PED_ANIMATION_UPDATE_POS";
		"PED_ANIMATION_INTERRUPTABLE";
		"PED_ANIMATION_FREEZE_LAST_FRAME";
	};

	property: Vehicle
	{
		get	= function()
			return this.GetVehicle();
		end;
		
		set	= function( Vehicle )
			if Vehicle then
				if getElementType( Vehicle ) == "vehicle" then
					this.WarpInVehicle( Vehicle, 0 );
				elseif type( Vehicle ) == "table" then
					if getElementType( Vehicle ) ~= "vehicle" then
						Error( 3, 2342, "Vehicle", "element:vehicle", tostring( Vehicle ) );
					end
					
					this.WarpInVehicle( Vehicle[ 1 ], Vehicle[ 2 ] );
				else
					Error( 3, 2342, "Vehicle", "element:vehicle' or 'table'", tostring( Vehicle ) );
				end
			else
				this.RemoveFromVehicle();
			end
		end;
	};
	
	Ped		= function( iModel, vecPosition, ... )
		vecPosition = vecPosition or new. Vector3();
		
		local pPed = createPed( iModel, vecPosition.X, vecPosition.Y, vecPosition.Z, ... );
		
		pPed( this );
		
		return pPed;
	end;
	
	_Ped					= function()
		return destroyElement( this );
	end;
	
	IsDead					= function()
		return isPedDead( this );
	end;
	
	WarpInVehicle			= function( Vehicle, Seat )
		return warpPedIntoVehicle( this, Vehicle, Seat or 0 );
	end;
	
	RemoveFromVehicle		= function()
		return removePedFromVehicle( this );
	end;
	
	AddClothes				= function( TextureName, ModelName, Type )
		return addPedClothes( this, TextureName, ModelName, Type );
	end;
	
	GetClothes				= function( Type )
		return getPedClothes( this, Type );
	end;
	
	RemoveClothes			= function()
		return removePedClothes( this );
	end;
	
	HaveJetPack				= function()
		return doesPedHaveJetPack( this );
	end;
	
	GetWeapon				= function()
		return getPedWeapon( this );
	end;
	
	SetWeaponSlot			= function( Slot )
		return setPedWeaponSlot( this, Slot );
	end;
	
	GetWeaponSlot			= function()
		return getPedWeaponSlot( this );
	end;
	
	GetAmmoInClip			= function()
		return getPedAmmoInClip( this );
	end;
	
	GetTotalAmmo			= function()
		return getPedTotalAmmo( this );
	end;
	
	GetArmor				= function()
		return getPedArmor( this );
	end;
	
	GetContactElement		= function()
		return getPedContactElement( this );
	end;
	
	GetVehicle				= function()
		return getPedOccupiedVehicle( this );
	end;
	
	GetStat					= function( StatID )
		return getPedStat( this, StatID );
	end;
	
	GetTarget				= function()
		return getPedTarget( this );
	end;
	
	IsChoking				= function()
		return isPedChoking( this );
	end;
	
	SetDoingDriveby			= function( Enabled )
		return setPedDoingGangDriveby( this, Enabled );
	end;
	
	IsDoingDriveby			= function()
		return isPedDoingGangDriveby( this );
	end;
	
	IsDucked				= function()
		return isPedDucked( this );
	end;
	
	IsHeadless				= function()
		return isPedHeadless( this );
	end;
	
	IsInVehicle				= function()
		return isPedInVehicle( this );
	end;
	
	IsOnFire				= function()
		return isPedOnFire( this );
	end;
	
	IsOnGround				= function()
		return isPedOnGround( this );
	end;
	
	SetAnimation			= function( File, Lib, ... )
		return setPedAnimation( this, File, Lib, ... );
	end;
	
	SetAnimationProgress	= function( Animation, Progress )
		return setPedAnimationProgress( this, Animation, Progress );
	end;
	
	SetHeadless				= function( Headless )
		return setPedHeadless( this, Headless )
	end;
	
	SetOnFire				= function( Enabled )
		return setPedOnFire( this, Enabled );
	end;
	
	SetWalkingStyle			= function( StyleID )
		return setPedWalkingStyle( this, StyleID );
	end;
	
	-- Client
	
	GetBonePosition			= function( iBone )
		return new. Vector3( getPedBonePosition( this, iBone ) );
	end;
	
	GetAnimation			= function()
		return getPedAnimation( this );
	end;
	
	GetMoveState			= function()
		return getPedMoveState( this );
	end;
	
	GetTask					= function( Priority, TaskType )
		return getPedTask( this, Priority, TaskType );
	end;
	
	IsDoingTask				= function( TaskName )
		return isPedDoingTask( this, TaskName );
	end;
	
	GetSimplestTask			= function()
		return getPedSimplestTask( this );
	end;
	
	SetCanBeKnockedOffBike	= function( Enabled )
		return setPedCanBeKnockedOffBike( this, Enabled );
	end;
	
	CanBeKnockedOffBike		= function()
		return canPedBeKnockedOffBike( this );
	end;
	
	GetTargetRange			= function()
		return getPedTargetRange( this );
	end;
	
	GetTargetCollision		= function( this )
		return new. Vector3( getPedTargetCollision( this ) );
	end;

	GetTargetStart			= function( this )
		return new. Vector3( getPedTargetStart( this ) );
	end;

	GetTargetEnd			= function( this )
		return new. Vector3( getPedTargetEnd( this ) );
	end;

	SetVoice				= function( VoiceType, VoiceName )
		return setPedVoice( this, VoiceType, VoiceName );
	end;
	
	GetVoice				= function()
		return getPedVoice( this );
	end;

	GetWeaponMuzzlePosition	= function( this )
		return new. Vector3( getPedWeaponMuzzlePosition( this ) );
	end;

	SetAimTarget			= function( this, pVector )
		pVector = pVector or new. Vector3();
		
		return setPedAimTarget( this, pVector.X, pVector.Y, pVector.Z );
	end;

	SetCameraRotation		= function( Rotation )
		return setPedCameraRotation( this, Rotation );
	end;
	
	SetControlState			= function( ControlName, Enabled )
		return setPedControlState( this, ControlName, Enabled );
	end;
	
	GetControlState			= function( ControlName )
		return getPedControlState( this, ControlName );
	end;

	SetLookAt				= function( this, pVector, ... )
		pVector = pVector or new. Vector3();
		
		return setPedLookAt( this, pVector.X, pVector.Y, pVector.Z, ... );
	end;
	
	-- Server
	
	GetFightingStyle		= function()
		return getPedFightingStyle( this );
	end;
	
	SetFightingStyle		= function( FightingStyle )
		return setPedFightingStyle( this, FightingStyle );
	end;
	
	GetGravity				= function()
		return getPedGravity( this );
	end;
	
	SetGravity				= function( Gravity )
		return setPedGravity( tihs, Gravity );
	end;
	
	GetVehicleSeat			= function()
		return getPedOccupiedVehicleSeat( this );
	end;
	
	GiveJetPack				= function()
		return givePedJetPack( this );
	end;
	
	RemoveJetPack			= function()
		return removePedJetPack( this );
	end;
	
	Kill					= function( Killer, Weapon, BodyPart, Stealth )
		return killPed( this, Killer, Weapon, BodyPart, Stealth == true );
	end;
	
	ReloadWeapon			= function()
		return reloadPedWeapon( this );
	end;
	
	SetArmor				= function( Armor )
		return setPedArmor( this, Armor );
	end;
	
	SetChoking				= function( Enabled )
		return setPedChoking( this, Enabled );
	end;
	
	SetStat					= function( StatID, Value )
		return setPedStat( this, StatID, Value );
	end;
	
	GiveWeapon				= function( WeaponID, Ammo, SetAsCurrent )
		return giveWeapon( this, WeaponID, Ammo, SetAsCurrent );
	end;
	
	SetWeaponAmmo			= function( WeaponID, Ammo, AmmoInClip )
		return setWeaponAmmo( this, WeaponID, Ammo, AmmoInClip );
	end;
	
	TakeAllWeapons			= function()
		return takeAllWeapons( this );
	end;
};