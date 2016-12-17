/*
fn_manageLottery.sqf
Kevin Webb
Handles new entries
*/
private["_Entry","_uid","_amount","_Entries","_bool","_int"];
_bool = true;
_int = 0;
_Entry = param [0,[],[[]]];
_uid = _Entry select 0;
_amount = _Entry select 1;
{
if(_uid == _x select 0) exitWith
{
	_bool = false;
	life_lottery_entries set[_int,[_uid,(_x select 1) + _amount]];
};
_int = _int + 1;
} forEach life_lottery_entries;
if(_bool) then {
life_lottery_entries pushBack _Entry; 
};