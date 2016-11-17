/* 
	File: fn_openMap.sqf
	
	Author: Chimps47
*/
disableSerialization;
if(!(createDialog "CHIMPmap")) exitWith {};
_map = findDisplay 38500;
_filterList = _map displayCtrl 1500; 
disableserialization;
_filterList lbAdd "Alle";
_filterList lbSetValue[(lbSize _filterList)-1,-1];
_filterList lbSetData[(lbSize _filterList)-1,"ALL"];

{
	_filterList lbAdd (_x select 0);
	_filterList lbSetValue[(lbSize _filterList)-1,_forEachIndex];
	_filterList lbSetData[(lbSize _filterList)-1,str(_x select 1)];
} forEach getArray(missionConfigFile >> "mapAreas" >> "filters");

if(playerSide == civilian && {count life_houses > 0}) then {
	_filterList lbAdd "Meine Häuser";
	_filterList lbSetValue[(lbSize _filterList)-1,-1];
	_houseMkrs = [];
	{
		_pos = call compile format["%1",_x select 0];
		_house = nearestBuilding _pos;
		_houseMkrs pushBack format["house_%1",(_house getVariable ["uid",-1])];
	} forEach life_houses;
	_filterList lbSetData[(lbSize _filterList)-1,str(_houseMkrs)];
};