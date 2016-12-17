disableSerialization;
_map = findDisplay 12;
_map ctrlCreate ["RscPicture", 2102];
_background = ((findDisplay 12) displayCtrl (2102));
_backX = 0.74 * safezoneW + safezoneX;
_backY = 0.69 * safezoneH + safezoneY;
_backW = 0.25 * safezoneW;
_backH = 0.29 * safezoneH;
_background ctrlSetPosition [_backX, _backY, _backW, _backH];
_background ctrlCommit 0;
_background ctrlSetText "mrkrFilter\tablet.paa";



_map ctrlCreate ["RscTree", 2103];
_tree = ((findDisplay 12) displayCtrl (2103));
_lbposX = 0.765 * safezoneW + safezoneX;
_lbposY = 0.725 * safezoneH + safezoneY;
_lbwidth = 0.2015 * safezoneW;
_lbheight = 0.2125 * safezoneH;
_tree ctrlSetPosition [_lbposX,_lbposY,_lbwidth, _lbheight];
_tree ctrlSetBackgroundColor [0, 0, 0, 0];
_tree ctrlCommit 0;
tvClear _tree;
_tree ctrlSetEventHandler ["TreeSelChanged","_this call FLTR_fnc_TreeSel"];
{_x setMarkerAlphaLocal 0;}forEach allMapMarkers;
	_allTrunk = _tree tvAdd [[],"Show All"];
	_tree tvSetPicture [[_allTrunk], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];
	_noneTrunk = _tree tvAdd [[],"Show None"];
	_tree tvSetPicture [[_noneTrunk], "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];
	_locTrunk = _tree tvAdd [[],"Cities"];
	_tree tvSetPicture [[_locTrunk], "\A3\ui_f\data\map\mapcontrol\Tourism_CA.paa"];
	_worldCenter = getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition");
	_worldSize = getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
	 _locations =  nearestLocations [_worldCenter, ["NameCity","NameCityCapital"], _worldSize];
	{
		_locBranch =  _tree tvAdd [[ _locTrunk],text _x];
		_count = _tree tvCount [_locTrunk];
		_tree tvSetData [ [_locTrunk,_count - 1], text _x];
	}forEach _locations;
	_sidePlr = side player;
	_sidePlrFormat = format ["%1",_sidePlr];
	_mrkrGroups = "(getText (_x >> 'side') == _sidePlrFormat || {getText (_x >> 'side') == 'Default'})" configClasses (missionConfigFile >> "CfgMarkerFilter" >> "markerGroups");
	//systemChat format ["%1 groups",_mrkrGroups];
	{
		_name = getText (_x >> "displayName");
		_mrkrGrpTrunk =  _tree tvAdd [[],_name];
		_count = _tree tvCount [];
		_index = _count - 1;
		_tree tvSetData [[_index], configName _x];
		_tree tvSetValue [[_index], 1];
		_tree tvSetPicture [[_index], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];
		_mrkrGrp = _tree tvData [_index];
		_cfgName = configName _x;
	//	systemChat format ["%1cfgname",_mrkrGrp];
		[_x, _mrkrGrpTrunk] call FLTR_fnc_addMrkrs;
	
	}forEach _mrkrGroups;
