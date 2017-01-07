/*
 @Author: SimZor
 @Description: Removes objects on the ground
 @Last edited:
*/
if (vehicle player isEqualTo player) then // Makes sure it's a player
{
 {
 deleteVehicle _x;
 } forEach nearestObjects [getpos player,["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"],3];
};
[] spawn {
 _huan = "Beschlagnahme alle Waffen und Magazine im Radius von 3 Metern...";
 [_huan,"green","slow"] call life_fnc_notify;
};