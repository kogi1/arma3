if(playerside == west)then{
	if (door_5 animationPhase "Door_1_rot" == 1) then {
		door_5 animate ["Door_1_rot", 0];
		hint "Türe geschlossen";
	} 
	else 
	{
		door_5 animate ["Door_1_rot", 1];
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung eine Zellentüre zu öffnen!";
};