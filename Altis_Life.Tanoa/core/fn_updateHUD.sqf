#include "..\script_macros.hpp"

for "_i" from 0 to 1 step 0 do {
	if(alive player)then{
		[] call life_fnc_hudUpdate;
	};
    uiSleep 10;
};
