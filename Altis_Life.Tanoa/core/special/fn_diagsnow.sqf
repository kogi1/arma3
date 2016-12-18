#include "..\..\script_macros.hpp"
disableSerialization;_side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};};
_box = CONTROL(2900,8654);
if(life_enableSnow)then{_box cbSetChecked true;}else{_box cbSetChecked false;};
