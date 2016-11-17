/* 
	File: fn_mapMarkers.sqf
	
	Author: Chimps47
		Map Filter
*/
_map = findDisplay 38500;
_filterList = _map displayCtrl 1500; 
if(lbCurSel _filterList == -1) exitWith {};
_currentMarkers = _filterList lbData (lbCurSel _filterList);
_mapMarkers = [];
_disallowedMapMarkers = getArray(missionConfigFile >> "mapAreas" >> "exclude");
{if(markerType _x != "Empty" && !(_x in _disallowedMapMarkers)) then {_mapMarkers pushBack _x;};} forEach allMapMarkers;

if(_currentMarkers == "ALL") then 
{
	{_x setMarkerAlphaLocal 1;} forEach _mapMarkers;
} else {
	_currentMarkers = call compile format["%1",_currentMarkers];
	{if(!(_x in _currentMarkers)) then {_x setMarkerAlphaLocal 0;} else {_x setMarkerAlphaLocal 1;};} forEach _mapMarkers;
};