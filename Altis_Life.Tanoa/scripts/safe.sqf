#define SAFETY_ZONES    ["Rebelop", 200], ["Rebelop_1", 200], ["Rebelop_2", 200]

   
    _zone1 = getMarkerPos "Rebelop"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
    _dis1 = 200;//Unterschiedliche Distanz der Einzelnen Safezones
    _m1 = createMarker ["sz1", _zone1];//Erstellt einen grünen Kreis um die Safezone herum
    _m1 setMarkerShape "ELLIPSE";//-||-
    _m1 setMarkerSize [_dis1,_dis1];//-||-
    _m1 setMarkerColor "ColorGreen";//-||-
   
    _zone2 = getMarkerPos "Rebelop_1"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
    _dis2 = 200;//Unterschiedliche Distanz der Einzelnen Safezones
    _m2 = createMarker ["sz2", _zone2];//Erstellt einen grünen Kreis um die Safezone herum
    _m2 setMarkerShape "ELLIPSE";
    _m2 setMarkerSize [_dis2,_dis2];
    _m2 setMarkerColor "ColorGreen";
	
	_zone3 = getMarkerPos "Rebelop_2"; // <-- HIER EURE SAFE_ZONE NAMEN REIN !!!
    _dis3 = 200;//Unterschiedliche Distanz der Einzelnen Safezones
    _m3 = createMarker ["sz3", _zone3];//Erstellt einen grünen Kreis um die Safezone herum
    _m3 setMarkerShape "ELLIPSE";
    _m3 setMarkerSize [_dis3,_dis3];
    _m3 setMarkerColor "ColorGreen";
	
     if (isDedicated) exitWith {};
     waitUntil {!isNull player};
 
switch (playerSide) do
{
    case west:
    {};
   
    case civilian:
    {
        player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
                deleteVehicle (_this select 6);
            };
        }];
    };
   
    case independent:
    {
        player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
                deleteVehicle (_this select 6);
            };
        }];
    };
};