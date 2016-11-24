if(playerside == west)then{
	if (door_4 animationPhase "Door_1_rot" == 1) then {
		door_4 animate ["Door_1_rot", 0];
		[zell_light4, "zellzu", 25] call life_fnc_globalSound;
		zell_light4 enableSimulation true; 
		sleep 1.9;
		zell_light4 enableSimulation false;
		hint "Türe geschlossen";
	} 
	else 
	{
		door_4 animate ["Door_1_rot", 1];
		[zell_light4, "zellauf", 25] call life_fnc_globalSound;
		zell_light4 enableSimulation true; 
		sleep 1.9;
		zell_light4 enableSimulation false;
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung eine Zellentüre zu öffnen!";
};