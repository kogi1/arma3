FLTR_fnc_TreeSel = 
{
	params ["_crtl","_index","_alpha"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_indexNum = _index select 0;
	if ((count _index) == 1) then
	{
		_sidePlr = side player;
		_sidePlrFormat = format ["%1",_sidePlr];
		_mrkrGrpsCfg = "(getText (_x >> 'side') == _sidePlrFormat || {getText (_x >> 'side') == 'Default'})"
		configClasses (missionConfigFile >> "CfgMarkerFilter" >> "markerGroups");
		_countAllMrkrs = count allMapMarkers;
		_mrkrArray = [];
		_sizeIndex = _tree tvCount [];		
	switch (_indexNum) do 
	{
		case 0: { 
					_alpha = 0;
					for "_i" from 3 to (_sizeIndex -1) do
					{		
						_tree tvSetPicture [[_i], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];
						_tree tvSetValue [[_i], 0];						
					};
				};
		case 1: { 
					_alpha = 1;
					for "_i" from 3 to (_sizeIndex -1) do
					{			
						_tree tvSetPicture [[_i], "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];
						_tree tvSetValue [[_i], 1];						
					};					
				};
		case 2: {};
		default { 			
					_mrkrGrp = _tree tvData _index;
					_alpha = _tree tvValue _index;
					_mrkrGrpsCfg = [(missionConfigFile >> "CfgMarkerFilter" >> "markerGroups" >> _mrkrGrp)];					
				};
	};
	{
		_mrkrNames = getArray (_x >> "mrkrNames");
		_mrkrTypes = getArray (_x >> "mrkrTypes");
		_mrkrTypeColors = getArray (_x >> "mrkrTypeColors");											
		if ((count _mrkrNames) >0) then 
		{		
			_mrkrArray append _mrkrNames;			
		}else
		{
			if ((count _mrkrTypes) >0) then 
			{
				for "_i" from 0 to (_countAllMrkrs -1) do
				{
					_mrkrName = allMapMarkers select _i;
					_type = getMarkerType _mrkrName;
					if (_type in _mrkrTypes) then
					{
						_mrkrArray pushBack _mrkrName;
					};
				};
			}else
			{
				if ((count _mrkrTypeColors) >0) then 
				{
					for "_i" from 0 to (_countAllMrkrs -1) do
					{
						_mrkrName = allMapMarkers select _i;					
						_type = getMarkerType _mrkrName;
						_color = getMarkerColor _mrkrName;
						_typeColor = [_type,_color];
						if (_typeColor in _mrkrTypeColors) then
						{
							_mrkrArray pushBack _mrkrName;
						};
					};		
				};
			};		
		};
	}forEach _mrkrGrpsCfg;	
	if (_alpha > 0) then 
	{
		_tree tvSetValue [[_indexNum], 0];
		_tree tvSetPicture [[_indexNum], "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa"];
		{
			_x setMarkerAlphaLocal 0;					
		}forEach _mrkrArray;	
	}else
	{
		_tree tvSetValue [[_indexNum], 1];
		_tree tvSetPicture [[_indexNum], "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa"];
		{
			_x setMarkerAlphaLocal 1;		
		}forEach _mrkrArray;		
	};		
	}else
	{
		//Location Sel
		if (_indexNum == 2) then {[_ctrl, _index] call FLTR_fnc_LocSel;}
		else
		{[_ctrl, _index] call FLTR_fnc_MrkrSel;};	
	};
};
FLTR_fnc_addMrkrs = 
{
	params ["_mrkrGrpCfg", "_mrkrGrpTrunk"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_mrkrNames = getArray (_x >> "mrkrNames");
	_mrkrTypes = getArray (_x >> "mrkrTypes");
	_mrkrTypeColors = getArray (_x >> "mrkrTypeColors");	
	if ((count _mrkrNames) >0) then 
	{
		{
			_text = markerText _x;
			_x setMarkerAlphaLocal 1;
			_mrkrBranch =  _tree tvAdd [[ _mrkrGrpTrunk],_text];
			_count = _tree tvCount [_mrkrGrpTrunk];
			_tree tvSetData [ [_mrkrGrpTrunk,_count - 1], _x];		
		}forEach _mrkrNames;
	}else
	{
		if ((count _mrkrTypes) >0) then 
		{
			{
				_type = getMarkerType _x;
				if (_type in _mrkrTypes) then
				{
					_text = markerText _x;
					_x setMarkerAlphaLocal 1;
					_mrkrBranch =  _tree tvAdd [[ _mrkrGrpTrunk],_text];
					_count = _tree tvCount [_mrkrGrpTrunk];
					_tree tvSetData [ [_mrkrGrpTrunk,_count - 1], _x];
				};
			}forEach allMapMarkers;
		}else
		{
			if ((count _mrkrTypeColors) >0) then 
			{
				{
					_type = getMarkerType _x;
					_color = getMarkerColor _x;
					_typeColor = [_type,_color];
					if (_typeColor in _mrkrTypeColors) then
					{
						_x setMarkerAlphaLocal 1;
						_text = markerText _x;
						_mrkrBranch =  _tree tvAdd [[ _mrkrGrpTrunk],_text];
						_count = _tree tvCount [_mrkrGrpTrunk];
						_tree tvSetData [ [_mrkrGrpTrunk,_count - 1], _x];
					};
				}forEach allMapMarkers;		
			};
		};	
	};
};
FLTR_fnc_MrkrSel =
{
	params ["_ctrl","_index"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_mrkrName =  _tree tvData _index;
	_mrkrName setMarkerAlphaLocal 1;
	_pos = markerPos _mrkrName;
	mapAnimClear;
	mapAnimAdd [0.75, 0.7,_pos];
	mapAnimAdd [0.75, 0.1,_pos];
	mapAnimCommit;
};
FLTR_fnc_LocSel = 
{
	params ["_ctrl","_index"];
	_tree = ((findDisplay 12) displayCtrl (2103));
	_data =  _tree tvData _index;
	 _locations =  nearestLocations [getPosATL player, ["NameCity","NameCityCapital"], 25000];
	{
		_name = text _x;
		if (_data == _name) then 
		{
			_pos = locationPosition _x;			
			mapAnimClear;
			mapAnimAdd [0.75, 0.7,_pos];
			mapAnimAdd [0.75, 0.1,_pos];
			mapAnimCommit;
		};
	}forEach _locations;
};
