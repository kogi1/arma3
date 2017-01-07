/*
	File: fn_empVehicle.sqf
	Author/Copyright: © 2014 nano2K - written for we-are-friendly.de
	Edited by: blackfisch for Native-Network
*/
private["_index","_vehicle"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
	if(nn_empInUse) exitWith { _huan = "Das EMP warnt grade schon ein Fahrzeug oder die Batterie muss sich erst wieder aufladen"; [_huan,"red","slow"] call life_fnc_notify;};
	nn_empInUse = true;
	_index = lbCurSel (2902);
	_vehicle = nn_last_vehicles select _index;
	if(isNull _vehicle) exitWith {};
	(vehicle player) say3D "empacsound";
	[_vehicle] remoteExec ["life_fnc_vehicleEmpd",crew _vehicle];
	sleep (3 * 60);
	nn_empInUse = false;
};
