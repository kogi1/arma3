/*
File: fn_globalsound.sqf
Play sound global
*/
private["_source","_sound"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,""] call BIS_fnc_param;
if(isNull _source) exitWith {};
if(_sound == "") exitWith {};
//_source say3D _sound;
[_source,_sound] remoteExec ["life_fnc_globalSoundClient"];