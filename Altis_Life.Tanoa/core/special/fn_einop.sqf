if(playerside == west)then{
	if (eingang animationPhase "Door_1_move" == 1) then {
		eingang animate ["Door_1_move", 0];
		[light_vera, "opengater", 25] call life_fnc_globalSound;
		//[[light_vera, true], "fn_enableSimulation"] call BIS_fnc_MP;
		light_vera enableSimulation true;
		sleep 5.9;
		//[[light_vera, false], "fn_enableSimulation"] call BIS_fnc_MP;
		light_vera enableSimulation false;
		hint "Türe geschlossen";
	} 
	else 
	{
		eingang animate ["Door_1_move", 1];
		[light_vera, "opengater", 25] call life_fnc_globalSound;
		light_vera enableSimulation true;
		sleep 5.9;
		light_vera enableSimulation false;
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung diesen Eingang zu öffnen!";
};

