/*
fn_buyTicket.sqf
Authors: Kevin Webb & Mike McCrow
Description: Client portion of lottery system
*/
[] spawn {
If (life_cash < 300) exitWith {_huan = format["Ticket kostet 300$. Dir fehlern $%1 für ein Ticket!",[(300 - life_cash)] call life_fnc_numberText]; [_huan,"red","slow"] call life_fnc_notify;};
_Entry = [];
createDialog "STS_KBW_price_diag";
waitUntil{!isNull (findDisplay 13371)};
ctrlSetText[2651,"Tippe die Menge ein die du kaufen willst: 300$ pro Ticket"];
waitUntil{isNull (findDisplay 13371) || life_charged};
if(!(life_charged)) exitWith {};
life_charged = false;
_amount = ctrlText 7331;
_amount = parseNumber (_amount);
if(_amount <= 0) exitWith { _huan = "Inkorrekte Nummer"; closeDialog 0; [_huan,"red","slow"] call life_fnc_notify;};
if(_amount > 250) exitWith { _huan = "Du kannst nicht mehr als 250 Ticket kaufen!"; closeDialog 0; [_huan,"red","slow"] call life_fnc_notify;};
_price = 300 * _amount;
if(life_cash < _price) exitWith { _huan = "Du hat nicht genung Geld um diese Anzahl von Tickets zu kaufen!"; [_huan,"red","slow"] call life_fnc_notify; closeDialog 0;};
_uid = getPlayerUID player;
_Entry = [_uid,_amount];
life_cash = life_cash - _price;
_huan = format["Du hast %1 Lotterietickets für $%2 gekafut, Viel Glück!",_amount,[_price] call life_fnc_numberText];
[_huan,"red","slow"] call life_fnc_notify;
[_Entry] remoteExec ["TON_fnc_manageLottery",2];
closeDialog 0;
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
};