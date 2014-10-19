-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2014
-- License		Proprietary Software
-- Version		1.0

CreateMarker	= createMarker;
CreatePickup	= createPickup;
CreateBlip		= createBlip;
CreateVehicle	= createVehicle;

FACTION_MAX_DEPTS		= 5;
FACTION_MAX_RANKS		= 16;

eFactionFlags			=
{
	government			= "government";
	police				= "police";
	fbi					= "fbi";
	medical				= "medical";
	news				= "news";
	licenses			= "licenses";
	ckill				= "ckill";
};

enum "eFactionType"
{
	FACTION_TYPE_GOV	= 0;
	FACTION_TYPE_LLC	= 1;
	FACTION_TYPE_LLP	= 2;
	FACTION_TYPE_CORP	= 3;
};

eFactionTypeNames		=
{
	[ FACTION_TYPE_GOV ]	= "Государственная организация";
	[ FACTION_TYPE_LLC ]	= "Limited Liability Company";
	[ FACTION_TYPE_LLP ]	= "Limited Liability Partnership";
	[ FACTION_TYPE_CORP ]	= "Corporation";
};

eFactionMaxMembers		=
{
	[ FACTION_TYPE_GOV ]	= 0xFF;
	[ FACTION_TYPE_LLC ]	= 0x0A;
	[ FACTION_TYPE_LLP ]	= 0x32;
	[ FACTION_TYPE_CORP ]	= 0x64;
};

eFactionTypePrice		=
{
	[ FACTION_TYPE_GOV ]	= 0;
	[ FACTION_TYPE_LLC ]	= 100000;
	[ FACTION_TYPE_LLP ]	= 100000;
	[ FACTION_TYPE_CORP ]	= 100000;
};

eFactionTypePriceGP		=
{
	[ FACTION_TYPE_GOV ]	= 0;
	[ FACTION_TYPE_LLC ]	= 0;
	[ FACTION_TYPE_LLP ]	= 250;
	[ FACTION_TYPE_CORP ]	= 500;
};

eFactionTax					=
{
	[ FACTION_TYPE_GOV ]	= 0.00;
	[ FACTION_TYPE_LLC ]	= 0.30;
	[ FACTION_TYPE_LLP ]	= 0.35;
	[ FACTION_TYPE_CORP ]	= 0.40;
};

eFactionRight		=
{
	STAFF_LIST		= 0x00000001;
	VIEW_STAFF		= 0x00000002;
	INVITE			= 0x00000004;
	UNINVITE		= 0x00000008;
	CHANGE_DEPT		= 0x00000010;
	CHANGE_RANK		= 0x00000020;
	CHANGE_RIGHTS	= 0x00000040;
	EDIT_NAME		= 0x00000080;
	EDIT_TAG		= 0x00000100;
	EDIT_DEPTS		= 0x00000200;
	BANK_LOG		= 0x00000400;
	BANK_TRANSFER	= 0x00000800;
	
	NONE			= 0x00000000;
	ALL				= 4294967295; -- 0xFFFFFFFF; -- TODO: MTA Lua client-side bug
};

-- TODO: MTA Lua client-side bug
eFactionRight.OWNER	= 4294966911; -- 0xFFFFFE7F; -- eFactionRight.ALL '^' ( ( eFactionRight.EDIT_NAME ) '|' ( eFactionRight.EDIT_TAG ) );

eFactionRightNames	=
{
	[ eFactionRight.STAFF_LIST ]		= "Просмотр списка сотрудников";
	[ eFactionRight.VIEW_STAFF ]		= "Просмотр информации сотрудников";
	[ eFactionRight.INVITE ]			= "Нанимать новых сотрудников";
	[ eFactionRight.UNINVITE ]			= "Увольнять сотрудников";
	[ eFactionRight.CHANGE_DEPT ]		= "Изменять отдел сотрудника";
	[ eFactionRight.CHANGE_RANK ]		= "Изменять должность сотрудника";
	[ eFactionRight.CHANGE_RIGHTS ]		= "Изменять права доступа сотрудников";
	[ eFactionRight.EDIT_NAME ]			= "Редактировать название организации";
	[ eFactionRight.EDIT_TAG ]			= "Редактировать аббревиатуру организации";
	[ eFactionRight.EDIT_DEPTS ]		= "Редактировать отделы организации";
	[ eFactionRight.BANK_LOG ]			= "Просматривать историю переводов";
	[ eFactionRight.BANK_TRANSFER ]		= "Управление счётом (перевод средств)";
};

enum "eInteriorType"
{
	INTERIOR_TYPE_NONE			= "interior";
	INTERIOR_TYPE_COMMERCIAL	= "business";
	INTERIOR_TYPE_HOUSE			= "house";
};

eInteriorTypeNames =
{
	[ INTERIOR_TYPE_NONE ]			= "Государственная недвижимость";
	[ INTERIOR_TYPE_COMMERCIAL ]	= "Коммерческая недвижимость";
	[ INTERIOR_TYPE_HOUSE ]			= "Дом/квартира";
};

enum "eWeapon"
{
	WEAPON_ACR			= 1851;
	WEAPON_AK12			= 1852;
	WEAPON_AUG			= 1853;
	WEAPON_FAMAS_F1		= 1854;
	WEAPON_SCAR_H		= 1855;
	WEAPON_SCAR_L		= 1856;
	WEAPON_SPAS12		= 1857;
	WEAPON_GLOCK17		= 1858;
	WEAPON_GLOCK18		= 1859;
	WEAPON_HK416		= 1860;
	WEAPON_HK417		= 1861;
	WEAPON_G36C			= 1862;
	WEAPON_MP5			= 1863;
	WEAPON_JNG90		= 1864;
	WEAPON_M4A1			= 1865;
	WEAPON_M9			= 1866;
	WEAPON_M1911		= 1867;
	WEAPON_MP443		= 1868;
	WEAPON_P90			= 1869;
	WEAPON_QBU88		= 1870;
	WEAPON_QBU88LMG		= 1871;
	WEAPON_RPG			= 1872;
	WEAPON_RPK74M		= 1873;
};

enum "eVehicle"
{
	ADMIRAL		= 445;
	ALPHA		= 602;
	AMBULAN		= 416;
	ANDROM		= 592;
	ARTICT1		= 435;
	ARTICT2		= 450;
	ARTICT3		= 591;
	AT400		= 577;
	BAGBOXA		= 606;
	BAGBOXB		= 607;
	BAGGAGE		= 485;
	BANDITO		= 568;
	BANSHEE		= 429;
	BARRACKS	= 433;
	BEAGLE		= 511;
	BENSON		= 499;
	BF400		= 581;
	BFINJECT	= 424;
	BIKE		= 509;
	BLADE		= 536;
	BLISTAC		= 496;
	BLOODRA		= 504;
	BMX			= 481;
	BOBCAT		= 422;
	BOXBURG		= 609;
	BOXVILLE	= 498;
	BRAVURA		= 401;
	BROADWAY	= 575;
	BUCCANEE	= 518;
	BUFFALO		= 402;
	BULLET		= 541;
	BURRITO		= 482;
	BUS			= 431;
	CABBIE		= 438;
	CADDY		= 457;
	CADRONA		= 527;
	CAMPER		= 483;
	CARGOBOB	= 548;
	CEMENT		= 524;
	CHEETAH		= 415;
	CLOVER		= 542;
	CLUB		= 589;
	COACH		= 437;
	COASTG		= 472;
	COMBINE		= 532;
	COMET		= 480;
	COPBIKE		= 523;
	COPCARLA	= 596;
	COPCARRU	= 599;
	COPCARSF	= 597;
	COPCARVG	= 598;
	CROPDUST	= 512;
	DFT30		= 578;
	DINGHY		= 473;
	DODO		= 593;
	DOZER		= 486;
	DUMPER		= 406;
	DUNERIDE	= 573;
	ELEGANT		= 507;
	ELEGY		= 562;
	EMPEROR		= 585;
	ENFORCER	= 427;
	ESPERANT	= 419;
	EUROS		= 587;
	FAGGIO		= 462;
	FARMTR1		= 610;
	FBIRANCH	= 490;
	FBITRUCK	= 528;
	FCR900		= 521;
	FELTZER		= 533;
	FIRELA		= 544;
	FIRETRUK	= 407;
	FLASH		= 565;
	FLATBED		= 455;
	FORKLIFT	= 530;
	FORTUNE		= 526;
	FREEWAY		= 463;
	FREIBOX		= 590;
	FREIFLAT	= 569;
	FREIGHT		= 537;
	GLENDALE	= 466;
	GLENSHIT	= 604;
	GREENWOO	= 492;
	HERMES		= 474;
	HOTDOG		= 588;
	HOTKNIFE	= 434;
	HOTRINA		= 502;
	HOTRINB		= 503;
	HOTRING		= 494;
	HUNTER		= 425;
	HUNTLEY		= 579;
	HUSTLER		= 545;
	HYDRA		= 520;
	INFERNUS	= 411;
	INTRUDER	= 546;
	JESTER		= 559;
	JETMAX		= 493;
	JOURNEY		= 508;
	KART		= 571;
	LANDSTAL	= 400;
	LAUNCH		= 595;
	LEVIATHN	= 417;
	LINERUN		= 403;
	MAJESTIC	= 517;
	MANANA		= 410;
	MARQUIS		= 484;
	MAVERICK	= 487;
	MERIT		= 551;
	MESA		= 500;
	MONSTER		= 444;
	MONSTERA	= 556;
	MONSTERB	= 557;
	MOONBEAM	= 418;
	MOWER		= 572;
	MRWHOOP		= 423;
	MTBIKE		= 510;
	MULE		= 414;
	NEBULA		= 516;
	NEVADA		= 553;
	NEWSVAN		= 582;
	NRG500		= 522;
	OCEANIC		= 467;
	PACKER		= 443;
	PATRIOT		= 470;
	PCJ600		= 461;
	PEREN		= 404;
	PETRO		= 514;
	PETROTR		= 584;
	PHOENIX		= 603;
	PICADOR		= 600;
	PIZZABOY	= 448;
	POLMAV		= 497;
	PONY		= 413;
	PREDATOR	= 430;
	PREMIER		= 426;
	PREVION		= 436;
	PRIMO		= 547;
	QUAD		= 471;
	RAINDANC	= 563;
	RANCHER		= 489;
	RCBANDIT	= 441;
	RCBARON		= 464;
	RCCAM		= 594;
	RCGOBLIN	= 501;
	RCRAIDER	= 465;
	RCTIGER		= 564;
	RDTRAIN		= 515;
	REEFER		= 453;
	REGINA		= 479;
	REMINGTN	= 534;
	RHINO		= 432;
	RNCHLURE	= 505;
	ROMERO		= 442;
	RUMPO		= 440;
	RUSTLER		= 476;
	SABRE		= 475;
	SADLER		= 543;
	SADLSHIT	= 605;
	SANCHEZ		= 468;
	SANDKING	= 495;
	SAVANNA		= 567;
	SEASPAR		= 447;
	SECURICA	= 428;
	SENTINEL	= 405;
	SHAMAL		= 519;
	SKIMMER		= 460;
	SLAMVAN		= 535;
	SOLAIR		= 458;
	SPARROW		= 469;
	SPEEDER		= 452;
	SQUALO		= 446;
	STAFFORD	= 580;
	STALLION	= 439;
	STRATUM		= 561;
	STREAK		= 538;
	STREAKC		= 570;
	STRETCH		= 409;
	STUNT		= 513;
	SULTAN		= 560;
	SUNRISE		= 550;
	SUPERGT		= 506;
	SWATVAN		= 601;
	SWEEPER		= 574;
	TAHOMA		= 566;
	TAMPA		= 549;
	TAXI		= 420;
	TOPFUN		= 459;
	TORNADO		= 576;
	TOWTRUCK	= 525;
	TRACTOR		= 531;
	TRAM		= 449;
	TRASH		= 408;
	TROPIC		= 454;
	TUG			= 583;
	TUGSTAIR	= 608;
	TURISMO		= 451;
	URANUS		= 558;
	UTILITY		= 552;
	UTILTR1		= 611;
	VCNMAV		= 488;
	VINCENT		= 540;
	VIRGO		= 491;
	VOODOO		= 412;
	VORTEX		= 539;
	WALTON		= 478;
	WASHING		= 421;
	WAYFARER	= 586;
	WILLARD		= 529;
	WINDSOR		= 555;
	YANKEE		= 456;
	YOSEMITE	= 554;
	ZR350		= 477;
};

VEHICLE_RADIO =
{
	{ "Channel N5", 		"http://radio.promodj.com:8000/channel5-192" 	};
	{ "Nu Channel", 		"http://radio.promodj.com:8000/nu-192" 			};
	{ "Full Moon Channel", 	"http://radio.promodj.com:8000/fullmoon-192" 	};
	{ "Deep Channel", 		"http://radio.promodj.com:8000/deep-192" 		};
	{ "300km/h Channel", 	"http://radio.promodj.com:8000/300kmh-192" 		};
	{ "Mini Channel", 		"http://radio.promodj.com:8000/mini-192" 		};
	{ "Old-School Channel", "http://radio.promodj.com:8000/oldschool-192" 	};
	{ "Vata Channel", 		"http://radio.promodj.com:8000/vata-192" 		};
	{ "Brainfck Channel", 	"http://radio.promodj.com:8000/brainfck-192"	};
	{ "Strange Channel", 	"http://radio.promodj.com:8000/strange-192" 	};	
	{ "16Bit.fm", 			"http://radio.promodj.com:8000/16bit-192" 		};
	{ "GarageFM", 			"http://radio.promodj.com:8000/garagefm-192"	};
	{ "Station 2.0", 		"http://radio.promodj.com:8000/station20-192" 	};
	{ "RNB Channel", 		"http://radio.promodj.com:8000/rnb-192" 		};	
};
