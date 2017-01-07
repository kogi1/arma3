#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
private ["_val"];
if (isNil "life_ticket_unit") exitWith {_huan = localize "STR_Cop_TicketNil"; [_huan,"red","slow"] call life_fnc_notify;};
if (isNull life_ticket_unit) exitWith {_huan = localize "STR_Cop_TicketExist"; [_huan,"red","slow"] call life_fnc_notify;};

_val = ctrlText 2652;

if (!([_val] call TON_fnc_isnumber)) exitWith {_huan = localize "STR_Cop_TicketNum"; [_huan,"red","slow"] call life_fnc_notify;};
if ((parseNumber _val) > 200000) exitWith {_huan = localize "STR_Cop_TicketOver100"; [_huan,"red","slow"] call life_fnc_notify;};

[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
