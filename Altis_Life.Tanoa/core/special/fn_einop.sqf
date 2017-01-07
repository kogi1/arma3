if(playerside == west)then{
	if (eingang animationPhase "Door_1_move" == 1) then {
		eingang animate ["Door_1_move", 0];
		[light_vera, "opengater", 25] call life_fnc_globalSound;
		//[[light_vera, true], "fn_enableSimulation"] call BIS_fnc_MP;
		light_vera enableSimulation true;
		sleep 5.9;
		//[[light_vera, false], "fn_enableSimulation"] call BIS_fnc_MP;
		light_vera enableSimulation false;
		_huan = "Türe geschlossen";
		[_huan,"green","slow"] call life_fnc_notify;
	} 
	else 
	{
		eingang animate ["Door_1_move", 1];
		[light_vera, "opengater", 25] call life_fnc_globalSound;
		light_vera enableSimulation true;
		sleep 5.9;
		light_vera enableSimulation false;
		_huan = "Türe geöffnet";
		[_huan,"green","slow"] call life_fnc_notify;
	};
}else{
	_huan = "Du hast keine berechtigung diesen Eingang zu öffnen!";
	[_huan,"red","slow"] call life_fnc_notify;
};

