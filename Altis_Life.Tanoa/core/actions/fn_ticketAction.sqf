/*
    File: fn_ticketAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the ticketing process.
*/
params [
    ["_unit",objNull,[objNull]]
];
disableSerialization;
if (!(createDialog "life_ticket_give")) exitWith {_huan = localize "STR_Cop_TicketFail"; [_huan,"red","slow"] call life_fnc_notify;};
if (isNull _unit || !isPlayer _unit) exitWith {};
ctrlSetText[2651,format [localize "STR_Cop_Ticket",_unit getVariable ["realname",name _unit]]];
life_ticket_unit = _unit;