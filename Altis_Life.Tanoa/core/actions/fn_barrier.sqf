/*
	Author: Warnerm14
	Contact: https://steamcommunity.com/id/Warnerm14/ or https://twitter.com/Warnerm14
	Desc: Warner's Barriers for Altis Life
	Permission: Feel free to adapt to work best for your server. Do not remove this comment block.
	Version 3
	Oct 2016
*/	
			player removeAction Barrier1;
			player removeAction Barrier2;
			player removeAction Barrier3;
			player removeAction Barrier4;	
			player removeaction Barrier5;
			player removeAction Barrier6;
			player removeAction Barrier7;
			player removeAction Barrier8;
			player removeAction Barrier9;
			player removeAction Barrier10;
			player removeAction Barrier11;
			
		BarrierOpen = 1;
	
	placeBarriers = {
		
		detach placeable; 
		placeable setVectorUP (surfaceNormal [(getPosATL placeable) select 0,(getPosATL placeable) select 1]);
		placeableClass = ((_this select 3)select 0);	
		placeable = placeableClass createVehicle position player;
		
		if (placeableClass == "Land_BarGate_F") then { 
			placeable attachTo [player, [0, 4, 4.3]];
			placeable allowdammage false;
		} else {
			if (placeableClass == "PlasticBarrier_03_blue_F") then { 
				placeable attachTo [player, [0, 2, 0.35]];	
				placeable allowdammage false;
				_light1 = "PortableHelipadLight_01_blue_F" createVehicle position player;  
				_light1 allowDamage false; 
				_light2 = "PortableHelipadLight_01_blue_F" createVehicle position player; 
				_light2 allowDamage false;
				_light1 attachTo [placeable, [-0.5,0,0.439]]; 
				_light2 attachTo [placeable, [0.5,0,0.439]];
				_light1 enableSimulation true;
				_light2 enableSimulation true;
			}else{
				if (placeableClass == "Land_PortableLight_double_F") then { 
					placeable attachTo [player, [0, 2, 1.20]];	
					placeable allowdammage false;
				}else{
					placeable attachTo [player, [0, 2, 0.35]];	
					placeable allowdammage false;			
				};
			};
		};
		
	};
	
	removeBarriers = {
		_barrier = position player nearObjects ["Land_CncBarrier_stripes_F", 3];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["Land_PlasticBarrier_03_F", 3];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["RoadCone_L_F", 3.5];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["RoadBarrier_F", 3];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["RoadBarrier_small_F", 3];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["Land_BarGate_F", 8];
		deleteVehicle (_barrier select 0);
		_barrtext = "";
		_barrier = position player nearObjects ["Land_PortableLight_double_F", 8];
		deleteVehicle (_barrier select 0);
		_barrier12 = [];
		_barrier12 = nearestObjects [player, ["PlasticBarrier_03_blue_F","PortableHelipadLight_01_blue_F"], 8];
		_cn = count _barrier12;
		if(_cn > 2)then
		{
			deleteVehicle (_barrier12 select 0);
			deleteVehicle (_barrier12 select 1);
			deleteVehicle (_barrier12 select 2);
		};
		
		//_barrtext = "asd";
		//if(_barrtext == "asd")then
		//{
		//	_barrier1 = position player nearObjects ["PortableHelipadLight_01_blue_F", 2];
		//	deleteVehicle (_barrier1 select 0);	
		//	_barrier2 = position player nearObjects ["PortableHelipadLight_01_blue_F", 2];
		//	deleteVehicle (_barrier2 select 0);	
		//	_barrtext = "";
		//};
		
	};
	
	
		Barrier1 = player addaction [("<t color=""#00ced1"">" + ("Road Barrier 1") +"</t>"),{call placeBarriers;},["Land_CncBarrier_stripes_F"],0.1,false,true,"","vehicle player == player"];
		Barrier2 = player addaction [("<t color=""#00ced1"">" + ("Road Barrier 2") +"</t>"),{call placeBarriers;},["Land_PlasticBarrier_03_F"],0.1,false,true,"","vehicle player == player"];	
		Barrier3 = player addaction [("<t color=""#00ced1"">" + ("Road Cone w/ Light") +"</t>"),{call placeBarriers;},["RoadCone_L_F"],0.1,false,true,"","vehicle player == player"];
		Barrier4 = player addaction [("<t color=""#00ced1"">" + ("Barricade") +"</t>"),{call placeBarriers;},["RoadBarrier_F"],0.1,false,true,"","vehicle player == player"];
		Barrier5 = player addaction [("<t color=""#00ced1"">" + ("Small Barricade w/ Light") +"</t>"),{call placeBarriers;},["RoadBarrier_small_F"],0.1,false,true,"","vehicle player == player"];	
		Barrier6 = player addaction [("<t color=""#00ced1"">" + ("Bargate") +"</t>"),{call placeBarriers;},["Land_BarGate_F"],0.1,false,true,"","vehicle player == player"];	
		Barrier10 = player addaction [("<t color=""#00ced1"">" + ("Light") +"</t>"),{call placeBarriers;},["Land_PortableLight_double_F"],0.1,false,true,"","vehicle player == player"];	
		Barrier11 = player addaction [("<t color=""#00ced1"">" + ("Polizei Barriere") +"</t>"),{call placeBarriers;},["PlasticBarrier_03_blue_F"],0.1,false,true,"","vehicle player == player"];	
		Barrier8 = player addaction [("<t color=""#0066d1"">" + ("Drop") +"</t>"),{detach placeable; placeable setVectorUP (surfaceNormal [(getPosATL placeable) select 0,(getPosATL placeable) select 1]);},[""],0.1,false,true,"","vehicle player == player"];
		Barrier9 = player addaction [("<t color=""#0066d1"">" + ("Remove") +"</t>"),{call removeBarriers},[""],0.1,false,true,"","vehicle player == player"];
		Barrier7 = player addaction [("<t color=""#FF3300"">" + ("### Close ###") +"</t>"),{
			
			player removeAction Barrier1;
			player removeAction Barrier2;
			player removeAction Barrier3;
			player removeAction Barrier4;	
			player removeaction Barrier5;
			player removeAction Barrier6;
			player removeAction Barrier7;
			player removeAction Barrier8;
			player removeAction Barrier9;
			player removeAction Barrier10;
			player removeAction Barrier11;
			
			detach placeable;
			placeable setVectorUP (surfaceNormal [(getPosATL placeable) select 0,(getPosATL placeable) select 1]);
			BarrierOpen = 0;
	}];