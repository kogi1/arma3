#include "..\..\script_macros.hpp"
/*
    File: fn_gangInvitePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Invites the player into the gang.
*/
private "_unit";
disableSerialization;

if ((lbCurSel 2632) isEqualTo -1) exitWith {_huan = localize "STR_GNOTF_SelectPerson"; [_huan,"red","slow"] call life_fnc_notify;};
_unit = call compile format ["%1",CONTROL_DATA(2632)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {_huan = localize "STR_GNOTF_InviteSelf"; [_huan,"red","slow"] call life_fnc_notify;};
if (!isNil {(group _unit) getVariable "gang_name"}) exitWith {_huan = localize "STR_GNOTF_playerAlreadyInGang"; [_huan,"red","slow"] call life_fnc_notify;}; //Added

if (count(group player getVariable ["gang_members",8]) == (group player getVariable ["gang_maxMembers",8])) exitWith {_huan = localize "STR_GNOTF_MaxSlot"; [_huan,"red","slow"] call life_fnc_notify;};

_action = [
    format [localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
    localize "STR_Gang_Invitation",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [profileName,group player] remoteExec ["life_fnc_gangInvite",_unit];
    _members = group player getVariable "gang_members";
    _members pushBack getPlayerUID _unit;
    group player setVariable ["gang_members",_members,true];
    _huan = format [localize "STR_GNOTF_InviteSent",_unit getVariable ["realname",name _unit]];
	[_huan,"green","slow"] call life_fnc_notify;
} else {
    _huan = localize "STR_GNOTF_InviteCancel";
	[_huan,"red","slow"] call life_fnc_notify;
};
