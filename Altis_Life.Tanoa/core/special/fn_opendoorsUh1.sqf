if(playerside == west)then{
	if (door_2 animationPhase "Door_1_rot" == 1) then {
		door_2 animate ["Door_1_rot", 0];
		[zell_light2, "zellzu", 25] call life_fnc_globalSound;
		zell_light2 enableSimulation true; 
		sleep 1.9;
		zell_light2 enableSimulation false;
		_huan = "Türe geschlossen";
		[_huan,"green","slow"] call life_fnc_notify;
	} 
	else 
	{
		door_2 animate ["Door_1_rot", 1];
		[zell_light2, "zellauf", 25] call life_fnc_globalSound;
		zell_light2 enableSimulation true; 
		sleep 1.9;
		zell_light2 enableSimulation false;
		_huan = "Türe geöffnet";
		[_huan,"green","slow"] call life_fnc_notify;
	};
}else{
	_huan = "Du hast keine berechtigung eine Zellentüre zu öffnen!";
	[_huan,"red","slow"] call life_fnc_notify;
};