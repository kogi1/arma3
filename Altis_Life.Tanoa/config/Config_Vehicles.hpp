class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: ARRAY (This is for limiting items to certain things)
    *            0: Variable to read from
    *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
    *            2: What to compare to (-1 = Check Disabled)
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } } //Apex DLC
        };
    };

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", { "", "", -1 } },
            { "C_Kart_01_Fuel_F", { "", "", -1 } },
            { "C_Kart_01_Red_F", { "", "", -1 } },
            { "C_Kart_01_Vrana_F", { "", "", -1 } }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", { "", "", -1 } },
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
            { "O_Truck_03_covered_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "I_Truck_02_fuel_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "C_Plane_Civil_01_F", { "", "", -1 } } //Apex DLC
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } },
            { "C_Boat_Transport_02_F", { "", "", -1 } }, //Apex DLC
            { "C_Scooter_Transport_01_F", { "", "", -1 } } //Apex DLC

        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
            { "O_T_MRAP_02_ghex_F", { "", "", -1 } },
            { "B_Heli_Light_01_stripped_F", { "", "", -1 } },
            { "B_G_Offroad_01_armed_F", { "", "", -1 } },
            { "O_T_LSV_02_unarmed_F", { "", "", -1 } }, //Apex DLC
			{ "B_T_VTOL_01_vehicle_F", { "", "", -1 } }, //Apex DLC
			{ "O_T_VTOL_02_vehicle_F", { "", "", -1 } } //Apex DLC

        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
			{ "C_SUV_01_F", { "", "", -1 } },
            { "I_Truck_02_medical_F", { "", "", -1 } },
            { "O_Truck_03_medical_F", { "", "", -1 } },
            { "B_Truck_01_medical_F", { "", "", -1 } },
			{ "B_Truck_01_transport_F", { "", "", -1 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "I_Heli_light_03_unarmed_F", { "", "", -1 } },
			{ "I_Heli_Transport_02_F", { "", "", -1 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "I_Truck_02_transport_F", { "life_coplevel", "SCALAR", 2 } },
			{ "C_Offroad_02_unarmed_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 3 } },
			{ "B_T_LSV_01_unarmed_F", { "life_coplevel", "SCALAR", 6 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 7 } },
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 8 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
			{ "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 3 } },
			{ "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 3 } },
			{ "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 6 } },
			{ "B_Heli_Attack_01_F", { "life_coplevel", "SCALAR", 7 } },
			{ "B_Heli_Transport_03_F", { "life_coplevel", "SCALAR", 8 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", { "", "", -1 } },
            { "B_Boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 3 } },
            { "B_SDV_01_F", { "", "", -1 } }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: ARRAY (license required)
    *         Ex: { "driver", "" , "" , "" } //civilian, west, independent, east
    *         licenses[] = { {"CIV"}, {"COP"}, {"MEDIC"}, {"EAST"} };
    *    Textures config follows { Texture Name, side, {texture(s)path}}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
        textures[] = {};
		impound = 20000;
    };

    // Apex DLC
    class C_Boat_Transport_02_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000;
		impound = 2500;
        textures[] = {};
    };

    // Apex DLC
    class C_Offroad_02_unarmed_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 12500;
		impound = 3500;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_WD40.paa"
            } },
			{ "Zivi", "civ", {
                "textures\fahrzeuge\civ\car\4wd.jpg"
            } }
		};
    };

    // Apex DLC
    class C_Plane_Civil_01_F {
        vItemSpace = 75;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 500000;
		impound = 20000;
        textures[] = {};
    };

    // Apex DLC
    class C_Scooter_Transport_01_F {
        vItemSpace = 30;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 2500;
		impound = 100;
        textures[] = {};
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 1200000;
		impound = 20000;
        textures[] = {};
    };

	// Apex DLC
    class B_T_VTOL_01_vehicle_F {
        vItemSpace = 2000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 12000000;
		impound = 120000;
        textures[] = {};
    };
	
	// Apex DLC
    class O_T_VTOL_02_vehicle_F {
        vItemSpace = 1000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 8000000;
		impound = 150000;
        textures[] = {};
    };
	
	// Apex DLC
    class B_T_LSV_01_unarmed_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 620000;
		impound = 50000;
        textures[] = {};
    };

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 25000;
		impound = 5000;
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 45000;
		impound = 4000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 60000;
		impound = 6000;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 45;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 5000;
		impound = 200;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
		impound = 20000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_ghost1.paa",
				"textures\fahrzeuge\cop\Pol_ghost2.paa"
            } },
			{ "SEK", "cop", {
                "textures\fahrzeuge\cop\SEK_ghosthawk1.paa",
				"textures\fahrzeuge\cop\SEK_ghosthawk2.paa"
            } }
		};
    };

	class I_Heli_light_03_unarmed_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
		impound = 20000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_hellcat.paa"
            } },
			{ "SEK", "cop", {
                "textures\fahrzeuge\cop\SEK_hellcat.paa"
            } },
			{ "ADAC", "med", {
                "textures\fahrzeuge\medic\adac_hellcat.jpg"
            } }
		};
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
		impound = 20000;
        textures[] = {
			{ "Rettung", "med", {
                "textures\fahrzeuge\medic\medic_mowhawk.jpg"
            } }
		};
    };
	
	class B_Heli_Attack_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
		impound = 20000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_blackfoot.paa"
            } }
		};
    };
	
	class O_Heli_Light_02_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
		impound = 20000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_orca.paa"
            } }
		};
    };
	
	class B_Heli_Transport_03_F {
        vItemSpace = 500;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 210000;
		impound = 21000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_huron1.paa",
				"textures\fahrzeuge\cop\Pol_huron2.paa"
            } }
		};
    };
    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 750000;
		impound = 50000;
        textures[] = {};
    };
	
	class I_MRAP_03_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 750000;
		impound = 50000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_strider.paa"
            } },
			{ "SEK", "cop", {
                "textures\fahrzeuge\cop\SEK_strider.paa"
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 75000;
		impound = 5000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 3000;
		impound = 500;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 285;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 410000;
		impound = 20000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 3200000;
		impound = 40000;
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
		impound = 100;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
		impound = 100;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
		impound = 100;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 12500;
		impound = 1200;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 750000;
		impound = 40000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 22000;
		impound = 2000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 20000;
		impound = 1000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 750;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 1840000;
		impound = 20000;
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 325;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 325000;
		impound = 20000;
        textures[] = {
			{ "Standart", "civ", {
                "\A3\soft_f_beta\Truck_01\Data\Truck_01_ext_01_CO.paa"
            } },
			{ "ADAC", "med", {
                "textures\fahrzeuge\medic\adac_hemtt.jpg"
            } }
		};
    };

    class O_T_MRAP_02_ghex_F {
        vItemSpace = 90;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 1500000;
		impound = 100000;
        textures[] = { };
    };

    class C_Offroad_01_F {
        vItemSpace = 90;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 12500;
		impound = 1500;
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
			{ "Camo", "civ", {
                "textures\fahrzeuge\civ\car\civ_offroad_camo.jpg"
            } },
			{ "Dodge", "civ", {
                "textures\fahrzeuge\civ\car\civ_offroad_dodge.jpg"
            } },
			{ "Rockstargelb", "civ", {
                "textures\fahrzeuge\civ\car\civ_offroad_rockstargelb.jpg"
            } },
			{ "Rockstarlila", "civ", {
                "textures\fahrzeuge\civ\car\civ_offroad_rockstarlila.jpg"
            } },
			{ "Weed", "civ", {
                "textures\fahrzeuge\civ\car\civ_offroad_weed.jpg"
            } },
			{ "Monster Energy", "civ", {
                "textures\fahrzeuge\civ\car\monsterenergy_off.jpg"
            } },
            { "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_offroad.paa"
            } },
			{ "Notarzt", "med", {
                "textures\fahrzeuge\medic\medic_offroad.jpg"
            } },
			{ "ADAC", "med", {
                "textures\fahrzeuge\medic\adac_offroad.jpg"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 15000;
		impound = 1500;
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F  : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 40000;
		impound = 4000;
        textures[] = {
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
			{ "Ken Block", "civ", {
                "textures\fahrzeuge\civ\car\hatchback_sport_ken_block.jpg"
            } },
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_hatchback.paa"
            } },
            { "SEK", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 2500;
		impound = 200;
        textures[] = {
            { "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            } },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            } },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            } },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            } },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            } },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            } },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 250;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 250000;
		impound = 5000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Transporter", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 200;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 130000;
		impound = 7000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "textures\fahrzeuge\cop\zamak_abg_01_polizei.jpg",
				"textures\fahrzeuge\cop\zamak_abg_02_polizei.jpg"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 510000;
		impound = 20000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 9500;
		impound = 500;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
            { "Yellow", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
            { "White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
            { "Grey", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 30000;
		impound = 1000;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Ferrari", "civ", {
                "textures\fahrzeuge\civ\car\civ_suv_ferrari.jpg"
            } },
			{ "Batman", "civ", {
                "textures\fahrzeuge\civ\car\batman_suv.jpg"
            } },
			{ "Camo", "civ", {
                "textures\fahrzeuge\civ\car\camo_suv.jpg"
            } },
			{ "Carbon", "civ", {
                "textures\fahrzeuge\civ\car\carbon_suv.jpg"
            } },
			{ "Monster", "civ", {
                "textures\fahrzeuge\civ\car\civ_suv_monster.jpg"
            } },
			{ "Skull", "civ", {
                "textures\fahrzeuge\civ\car\civ_suv_skull.jpg"
            } },
			{ "Racing Rot", "civ", {
                "textures\fahrzeuge\civ\car\civ_suv_racingrot.jpg"
            } },
			{ "Racing Grau", "civ", {
                "textures\fahrzeuge\civ\car\civ_suv_racinggrau.jpg"
            } },
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_SUV.paa"
            } },
            { "SEK", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
			{ "Rettung", "med", {
                "textures\fahrzeuge\medic\medic_suv.jpg"
            } },
			{ "ADAC", "med", {
                "textures\fahrzeuge\medic\adac_suv.jpg"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 45000;
		impound = 2000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 150;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 100000;
		impound = 3000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 30000;
		impound = 1547;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_hunter1.paa",
                "textures\fahrzeuge\cop\Pol_hunter2.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 120;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 375000;
		impound = 20000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
			{ "Red Bull", "reb", {
                "textures\fahrzeuge\civ\air\civ_hummingbird_redbull.jpg"
            } },
			{ "Hello Kitty", "reb", {
                "textures\fahrzeuge\civ\air\civ_hummingbird_kitty.jpg"
            } }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        price = 245000;
		impound = 20000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\fahrzeuge\cop\hummingbird_polizei.jpg"
            } },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "Rettung", "med", {
                "textures\fahrzeuge\medic\medic_littlebird.jpg"
            } }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 75;
        price = 245000;
		impound = 20000;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        licenses[] = { {"pilot" }, {""}, {"mAir"}, {""} };
        price = 750000;
		impound = 50000;
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "Polizei", "cop", {
                "textures\fahrzeuge\cop\Pol_orca.paa"
            } }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 150000;
		impound = 10000;
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 20;
        vFuelSpace = 19500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 160000;
		impound = 10000;
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            } },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 40;
        vFuelSpace = 42000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 250000;
		impound = 15000;
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 50000;	
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 400000;
		impound = 20000;
        textures[] = {};
    };
};
