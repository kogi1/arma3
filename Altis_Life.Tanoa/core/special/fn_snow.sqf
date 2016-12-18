if(life_enableSnow)then {
	[] spawn{
					"colorCorrections" ppEffectAdjust [1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.1], [0.399, 0.287, 0.014, 0.0]];
					"colorCorrections" ppEffectCommit 0;
					"colorCorrections" ppEffectEnable TRUE;
					setWind [1.342, 3.108, true];
					_obj = player;
					if ((count _this) > 0) then{_obj = _this select 0;};
					_pos = position (vehicle _obj);
					snow = "#particlesource" createVehicle _pos;
					snow setParticleParams [["\A3\Data_f\cl_water.p3d", 2, 1, 1], "","Billboard",1,7,[0, 0, 20.0], [0, 0, -0.35],1.0,0.000001,0.0, 0.4, [0.17,0.05], [[1.0,1.0,1.0,1.0], [0.94,0.94,0.96,1.0], [1.0,1.0,1.0,1.0]], [0, 1], 0, 0.01, "", "", _obj];
					snow setParticleRandom [2, [35, 35, 10], [0.0, 0.0, -0.1], 0.001, 0.05, [0.01, 0.01, 0.01, 0.02], 0.002, 360];
					snow setParticleCircle [0, [0.0, 0.0, -0.01] ];
					snow setDropInterval 0.0005;
					fogs = "#particlesource" createVehicle _pos; 
					fogs setParticleParams [["\A3\Data_f\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [7,6], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", _obj];
					fogs setParticleRandom [3, [55, 55, 0.2], [0, 0, -0.1], 2, 0.45, [0, 0, 0, 0.1], 0, 0];
					fogs setParticleCircle [0.1, [0, 0, -0.12]];
					fogs setDropInterval 0.01;
					while {true} do 
					{
						_pos = position (vehicle _obj);
						snow setpos _pos;
						fogs setpos _pos;
						sleep 1;
					};
					};
}else{
	"colorCorrections" ppEffectEnable false;
	deleteVehicle snow;
	deleteVehicle fogs;
};
