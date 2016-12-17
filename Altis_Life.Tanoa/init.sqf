/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;
["Server Started!"] remoteExecCall ["A3Log", 2];
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\safe.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "scripts\vis\fn_vehInfo.sqf";
_fltrFnc = [] spawn compile PreprocessFileLineNumbers "scripts\mrkrFilter\FLTR_fnc_Main.sqf";
waitUntil {scriptDone _fltrFnc};
fn_enableSimulation = {

	(_this select 0) enableSimulation (_this select 1);

};
StartProgress = true;