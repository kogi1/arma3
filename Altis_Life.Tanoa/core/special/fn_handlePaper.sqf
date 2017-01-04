#include "..\..\script_macros.hpp"
private["_type"];
_type = [_this,0,0,[[],0]] call BIS_fnc_param;
BANK = BANK + _type;
[1] call SOCK_fnc_updatePartial;