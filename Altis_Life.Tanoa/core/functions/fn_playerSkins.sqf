#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {
        if (LIFE_SETTINGS(getNumber,"civ_skins") isEqualTo 1) then {
            if (uniform player isEqualTo "U_C_Poloshirt_blue") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_1.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_2.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_stripped") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_3.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_tricolour") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_4.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_salmon") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_5.jpg"];
            };
            if (uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_6.jpg"];
            };
            if (uniform player isEqualTo "U_C_Commoner1_1") then {
                player setObjectTextureGlobal [0, "textures\civilian_uniform_7.jpg"];
            };
        };
    };

    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            _skinName = "textures\human\cop\rekrut.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 1) then {
                if (FETCH_CONST(life_coplevel) >= 1) then {
                    _skinName = ["textures\human\cop\rekrut_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		// Cop Level 2
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_vest") then {
            _skinName = "textures\human\cop\polizei_uniform.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 2) then {
                if (FETCH_CONST(life_coplevel) >= 2) then {
                    _skinName = ["textures\human\cop\polizei_uniform_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		// Cop Level 3
		if (uniform player isEqualTo "U_B_SpecopsUniform_sgg") then {
            _skinName = "textures\human\cop\polizei2.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 3) then {
                if (FETCH_CONST(life_coplevel) >= 3) then {
                    _skinName = ["textures\human\cop\polizei2_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
		// Cop Level 6 (SEK)
		if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
            _skinName = "textures\human\cop\sek.jpg";
            if (LIFE_SETTINGS(getNumber,"cop_extendedSkins") isEqualTo 6) then {
                if (FETCH_CONST(life_coplevel) >= 6) then {
                    _skinName = ["textures\human\cop\sek_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
                };
            };
            player setObjectTextureGlobal [0, _skinName];
        };
		
    };

    case independent: {
        if (uniform player isEqualTo "U_B_HeliPilotCoveralls") then {
            player setObjectTextureGlobal [0, "textures\human\medic\adac_uniform.jpg"];
        };
		
		if (uniform player isEqualTo "U_O_OfficerUniform_ocamo") then {
            player setObjectTextureGlobal [0, "textures\human\medic\medic_uniform.jpg"];
        };
		
		if (backpack player isEqualTo "B_Kitbag_cbr") then {
            player setObjectTextureGlobal [0, "textures\human\medic\adac_backpack.jpg"];
        };
		
		if (backpack player isEqualTo "B_Kitbag_sgg") then {
            player setObjectTextureGlobal [0, "textures\human\medic\medic_backpack.jpg"];
        };
    };
};
