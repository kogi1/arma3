if(playerside == west)then{
	if (eingang animationPhase "Door_1_move" == 1) then {
		eingang animate ["Door_1_move", 0];
		hint "Türe geschlossen";
	} 
	else 
	{
		eingang animate ["Door_1_move", 1];
		hint "Türe geöffnet";
	};
}else{
	hint"Du hast keine berechtigung eine Zellentüre zu öffnen!";
};

