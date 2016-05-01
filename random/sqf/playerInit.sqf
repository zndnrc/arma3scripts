waitUntil {!isNull player};
_unit = _this select 0;
_unit enableFatigue false;

comment "Exported from Arsenal";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "M81_Camo_crye_TS";
for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
_unit addVest "V_PlateCarrier1_blk";
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 10 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
_unit addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addItemToBackpack "MineDetector";
_unit addItemToBackpack "muzzle_snds_H";
_unit addItemToBackpack "acc_pointer_IR";
_unit addItemToBackpack "NVGoggles";
_unit addHeadgear "H_Shemag_olive_hs";
_unit addGoggles "G_Combat";

comment "Add weapons";
_unit addWeapon "arifle_MX_Black_F";
_unit addPrimaryWeaponItem "acc_flashlight";
_unit addPrimaryWeaponItem "optic_AMS";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "hgun_Rook40_F";
_unit addHandgunItem "muzzle_snds_L";
_unit addWeapon "Laserdesignator";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "MineDetector";
