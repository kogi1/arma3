#include "..\..\script_macros.hpp"
/*
file: fn_newMsg.sqf 
Author: Silex 
*/
private["_to","_type","_playerData","_msg"];
disableSerialization;
_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;
switch(_type) do{ 
 case 0: { 
 life_smartphoneTarget = call compile format["%1",_playerData];
 ctrlSetText[88886, format["Nachricht: %1",name life_smartphoneTarget]];
 if((FETCH_CONST(life_adminlevel) < 1)) then {
 ctrlShow[888897,false];
 };
 };
 //normal message 
 case 1: { 
 if(isNUll life_smartphoneTarget) exitWith {_huan = format["Keine Person ausgew�hlt!"];
 [_huan,"red","slow"] call life_fnc_notify;
};
 ctrlShow[88885, false];
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 ctrlShow[88885, true];
};
[life_smartphoneTarget,_msg,player,0] remoteExec ["TON_fnc_handleMessages",2];
 _huan = format["Du hast %1 folgende Nachricht gesendet: %2",name life_smartphoneTarget,_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 ctrlShow[88885, true];
 closeDialog 88883;
 };
 //copmessage 
 case 2: { if(({side _x == west} count playableUnits) == 0) exitWith {_huan = format["Die Polizei ist momentan nicht erreichbar, bitte versuchen Sie es sp�ter erneut."];
 [_huan,"red","slow"] call life_fnc_notify;
};
 ctrlShow[888895,false];
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 ctrlShow[888895,true];
};
[ObjNull,_msg,player,1] remoteExec ["TON_fnc_handleMessages",2];
 _to = "der Polizei";
 _huan = format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 ctrlShow[888895,true];
 closeDialog 887890;
 };
 //msgadmin 
 case 3: { ctrlShow[888896,false];
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 ctrlShow[888896,true];
};
[ObjNull,_msg,player,2] remoteExec ["TON_fnc_handleMessages",2];
 _to = "den Admins";
 _huan = format["Du hast %1 folgende Nachricht gesendet: %2",_to,_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 ctrlShow[888896,true];
 closeDialog 887890;
 };
 //emsrequest 
 case 4: { if(({side _x == independent} count playableUnits) == 0) exitWith {_huan = format["Currently there is no EMS on duty . Please try again later."];
 [_huan,"red","slow"] call life_fnc_notify;
};
 ctrlShow[888899,false];
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 ctrlShow[888899,true];
};
[ObjNull,_msg,player,3] remoteExec ["TON_fnc_handleMessages",2];
 _huan format["Du hast eine Nachricht an die Rettungs/ADAC Dienststelle gesendet.",_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 ctrlShow[888899,true];
 closeDialog 887890;
 };
 //adminToPerson 
 case 5: { if((call life_adminlevel) < 1) exitWith {_huan = "Du bist kein Admin!";
 [_huan,"red","slow"] call life_fnc_notify;
};
 if(isNULL life_smartphoneTarget) exitWith {_huan = format["Keine Person ausgew�hlt!"];
 [_huan,"red","slow"] call life_fnc_notify;
 };
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 };
[life_smartphoneTarget,_msg,player,4] remoteExec ["TON_fnc_handleMessages",2];
 _huan = format["Admin Nachricht: %1 - Nachricht: %2",name life_smartphoneTarget,_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 closeDialog 88883;
 };
 //emergencyloading 
 case 6: { if((FETCH_CONST(life_adminlevel) < 1)) then {
 ctrlShow[888898,false];
 ctrlShow[888896,true];
 } else { 
 ctrlShow[888898,true];
 ctrlShow[888896,false];
 };
 };
 //adminMsgAll 
 case 7: { if((FETCH_CONST(life_adminlevel) < 1)) exitWith {_huan = "Du bist kein Admin!";
 [_huan,"red","slow"] call life_fnc_notify;
};
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 };
[ObjNull,_msg,player,5] remoteExec ["TON_fnc_handleMessages",2];
 _huan = format["Eine Nachricht wurde an alle Admins gesendet: %1",_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 closeDialog 887890;
 };
  case 8: { if((FETCH_CONST(life_coplevel) < 3)) exitWith {_huan = "Du bist dazu nicht ber�chtigt!";
  [_huan,"red","slow"] call life_fnc_notify;
};
 if(_msg == "") exitWith {_huan = "Du kannst keine leere Nachricht senden!";
 [_huan,"red","slow"] call life_fnc_notify;
 };
[ObjNull,_msg,player,6] remoteExec ["TON_fnc_handleMessages",2];
 _huan = format["Polizeirundfunk ist raus: %1",_msg];
 [_huan,"blue","slow"] call life_fnc_notify;
 closeDialog 887890;
 };
};