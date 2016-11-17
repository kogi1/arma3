/* 
 Author: Chimps47
*/
class CHIMPmap
{
 idd = 38500;
 movingEnabled = false;
 enableSimulation = true;
 onUnload = "[] spawn {{if(markerType _x != ""Empty"") then {_x setMarkerAlphaLocal 1;};} forEach allMapMarkers;};";
 class controlsBackground {
 class Map: Life_RscMapControl
 {
 idc = 1200;
 x = -0.00161606 * safezoneW + safezoneX;
 y = 0.0407398 * safezoneH + safezoneY;
 w = 1.0092 * safezoneW;
 h = 0.980128 * safezoneH;
 };
 };
 class controls
 { 
 class FilterList: Life_RscListBox
 {
 idc = 1500;
 onLBSelChanged = "[] spawn life_fnc_mapMarkers;";
 sizeEx = 1.3;
 x = 0.0101562 * safezoneW + safezoneX;
 y = 0.104 * safezoneH + safezoneY;
 w = 0.144375 * safezoneW;
 h = 0.726 * safezoneH; 
 tooltip = "Select a filter to show the map markers relating to the filter.";
 };
 class FilterText: Life_RscText
 {
 idc = 1001;
 text = "MAP FILTERS";
 x = 0.0101562 * safezoneW + safezoneX;
 y = 0.071 * safezoneH + safezoneY;
 w = 0.144375 * safezoneW;
 h = 0.033 * safezoneH;
 colorBackground[] = {0,0.8,0.9,1};
 };
 class MapView: Life_RscText
 {
 idc = 1000;
 text = "Map Filter by Chimps47";
 x = -0.000156274 * safezoneW + safezoneX;
 y = -0.00599999 * safezoneH + safezoneY;
 w = 1.00547 * safezoneW;
 h = 0.044 * safezoneH;
 colorBackground[] = {0,0.8,0.9,1};
 };
 };
};