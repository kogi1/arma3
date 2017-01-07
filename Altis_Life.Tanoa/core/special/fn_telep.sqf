#include "..\..\script_macros.hpp"
_mode = param [0,0,[0]];
switch (_mode) do {
    case 0: {};
	case 1: {
	if(playerside == west OR playerside == independent)then{
        cutText ["Lift fährt hoch...", "BLACK FADED"];
		if (lift_boden animationPhase "Door_1_rot" == 1) then {lift_boden animate ["Door_1_rot", 0];};
		if (lift_dach animationPhase "Door_1_rot" == 1) then {lift_dach animate ["Door_1_rot", 0];};
		sleep 3;
		player setPos[5685.79,10610.2,40.334];
		sleep 4;
		titleCut ["", "BLACK IN", 5];
	}else{
			_huan = "Du darfst den Lift nicht nutzen!";
			[_huan,"red","slow"] call life_fnc_notify;
		};
    };
	case 2: {
	if(playerside == west OR playerside == independent)then{
        cutText ["Lift fährt runter...", "BLACK FADED"];
		if (lift_dach animationPhase "Door_1_rot" == 1) then {lift_dach animate ["Door_1_rot", 0];};
		if (lift_boden animationPhase "Door_1_rot" == 1) then {lift_boden animate ["Door_1_rot", 0];};
		sleep 3;
		player setPos[5673.72,10619.3,0.0504456];	
		sleep 2;
		titleCut ["", "BLACK IN", 5];
	}else{
			_huan = "Du darfst den Lift nicht nutzen!";
			[_huan,"red","slow"] call life_fnc_notify;
		};
    };
	case 3: {

    };
	case 4: {

    };
	
};