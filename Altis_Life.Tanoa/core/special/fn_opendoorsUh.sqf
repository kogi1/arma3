if(playerside == west)then{
	if (door_1 animationPhase "Door_1_rot" == 1) then {
		door_1 animate ["Door_1_rot", 0];
		[zell_light1, "zellzu", 25] call life_fnc_globalSound;
		zell_light1 enableSimulation true; 
		sleep 1.9;
		zell_light1 enableSimulation false;
		hint "Türe geschlossen";
	} 
	else 
	{
		door_1 animate ["Door_1_rot", 1];
		[zell_light1, "zellauf", 25] call life_fnc_globalSound;
		zell_light1 enableSimulation true; 
		sleep 1.9;
		zell_light1 enableSimulation false;
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung eine Zellentüre zu öffnen!";
};