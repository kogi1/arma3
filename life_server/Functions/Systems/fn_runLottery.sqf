/*
fn_RunLottery.sqf
Mike McCrow
The timer for when the lottery is to be drawn.
*/
private["_timer"];
_timer = 0;
while {true} do
{
	uiSleep (10*60);
	_timer = _timer + 1;
	if (_timer == 3) then {[0,"The Tanoa Lottery will be drawn in 90 minutes."] remoteExec ["life_fnc_broadcast",0];};
	if (_timer == 6) then {[0,"The Tanoa Lottery will be drawn in 1 Hour."] remoteExec ["life_fnc_broadcast",0];};
	if (_timer == 9) then {[0,"The Tanoa Lottery will be drawn in 30 Minutes."] remoteExec ["life_fnc_broadcast",0];};
	if (_timer == 11) then {[0,"The Tanoa Lottery will be drawn in 10 Minutes."] remoteExec ["life_fnc_broadcast",0];};
	if (_timer == 12) then { [] remoteExec ["TON_fnc_LotteryPick",2]; _timer = 0; };
};