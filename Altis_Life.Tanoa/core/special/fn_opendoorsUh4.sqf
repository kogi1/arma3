if(playerside == west)then{
	if (door_5 animationPhase "Door_1_rot" == 1) then {
		door_5 animate ["Door_1_rot", 0];
		[zell_light5, "zellzu", 25] call life_fnc_globalSound;
		zell_light5 enableSimulation true; 
		sleep 1.9;
		zell_light5 enableSimulation false;
		hint "Türe geschlossen";
	} 
	else 
	{
		door_5 animate ["Door_1_rot", 1];
		[zell_light5, "zellauf", 25] call life_fnc_globalSound;
		zell_light5 enableSimulation true; 
		sleep 1.9;
		zell_light5 enableSimulation false;
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung eine Zellentüre zu öffnen!";
};