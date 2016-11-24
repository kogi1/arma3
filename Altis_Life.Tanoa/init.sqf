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
fn_enableSimulation = {

	(_this select 0) enableSimulation (_this select 1);

};
StartProgress = true;