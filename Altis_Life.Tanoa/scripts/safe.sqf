/*
 File: fn_safezones.sqf
 Author: keine Ahnung :D Hab das Script vor ewigkeiten mal auf meiner platte Gefunden
 Editor: #Provokan
 Editet by #2: Rääph DDoSantos
 Description: kein Kravalla in Kavalla :)
 löscht die einzelnen Kugeln.
*/
private ["_eh1","_inArea","_zone1","_zone2","_zone3","_zone4","_zone5","_dis"];
_zone1 = getMarkerPos "cop_spawn_2"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
_dis1 = 150;//Unterschiedliche Distanz der Einzelnen Safezones
_m1 = createMarker ["sz1", _zone1];//Erstellt einen grünen Kreis um die Safezone herum
_m1 setMarkerShape "ELLIPSE";//-||-
_m1 setMarkerSize [_dis1,_dis1];//-||-
_m1 setMarkerColor "ColorGreen";//-||-

_zone2 = getMarkerPos "Rebelop"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
_dis2 = 200;//Unterschiedliche Distanz der Einzelnen Safezones
_m2 = createMarker ["sz2", _zone2];//Erstellt einen grünen Kreis um die Safezone herum
_m2 setMarkerShape "ELLIPSE";//-||-
_m2 setMarkerSize [_dis2,_dis2];//-||-
_m2 setMarkerColor "ColorGreen";//-||-

_zone3 = getMarkerPos "Rebelop_1"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
_dis3 = 500;//Unterschiedliche Distanz der Einzelnen Safezones
_m3 = createMarker ["sz3", _zone3];//Erstellt einen grünen Kreis um die Safezone herum
_m3 setMarkerShape "ELLIPSE";
_m3 setMarkerSize [_dis3,_dis3];
_m3 setMarkerColor "ColorGreen";


_inArea = false;
while {true} do
        {
            if (alive player) then
            {
                if (((_zone1 distance player < _dis1) || (_zone2 distance player < _dis2) || (_zone3 distance player < _dis3) && (!_inArea))) then
                {
					if(playerside == civilian) then 
					{
						eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6);}];
					};
                    _inArea = true;
                    hintSilent parseText "<t color='#FF0000'><t size='2'><t align='center'>Warnung<br/><br/><t align='center'><t size='1'><t color='#ffffff'>Du betrittst eine Safezone. Holster dein Waffe. Du kannst niemanden ausrauben oder toeten!";
                    player allowDamage false;
                };
                if (((_zone1 distance player > _dis1) && (_zone2 distance player > _dis2) && (_zone3 distance player > _dis3)) && (_inArea)) then
                {
					if(playerside == civilian)then 
					{
						player removeEventHandler ["fired", eh1];
					};
                    _inArea = false;
                    hintSilent parseText "<t color='#FF0000'><t size='2'><t align='center'>Warnung<br/><br/><t align='center'><t size='1'><t color='#ffffff'>Du verlässt die Safezone.";
                    player allowDamage true;
                };
            };
			sleep 3;
        };
   