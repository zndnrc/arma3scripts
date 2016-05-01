// this addAction ["Rearm group AIs", { {nul = [_x] execVM "rearmUnit.sqf"} foreach units group player - playableUnits;player sidechat "Group AIs rearmed!"; }];


_unit = _this select 0;
_primaryWeapon = primaryWeapon _unit;
_secondaryWeapon = secondaryWeapon _unit;
_handgunWeapon = handgunWeapon _unit;
_weaponArray = [_primaryWeapon, _secondaryWeapon, _handgunWeapon];

_primaryMagCount = 5; // magazine count to add for primaryWeapon
_secondaryMagCount = 2; // magazine count to add for secondaryWeapon
_handgunMagCount = 2;  // magazine count to add for handgunWeapon

_magazineIndex = 0; // index of magazine class in weapon's config

// AI only
if(_unit != player) 
then {
	// Heal unit ;)
	_unit setDamage 0;

	//Fill current magazines
	_unit setAmmo [primaryWeapon player, 100];
	_unit setAmmo [secondaryWeapon player, 100];
	
	//Add magazines
	{
		if (_x != "") then
		{
			_magazines = getArray (configFile / "CfgWeapons" / _x / "magazines");
			_magazineClass = _magazines select (_magazineIndex min (count _magazines - 1));
			
			_magazineCount = 0;
			if(_x == _primaryWeapon)
			then {
				_magazineCount = _primaryMagCount;
			};
			if(_x == _secondaryWeapon) 
			then {
				_magazineCount = _secondaryMagCount;
			};
			if(_x == _handgunWeapon) 
			then {
				_magazineCount = _handgunMagCount;
			};
			
			// get current mag count
			_currentMagCount = 0;
			{
				if(_x == _magazineClass) 
				then {
					_currentMagCount = _currentMagCount + 1;
				};
			} forEach magazines _unit;
			
			// add magazines till _magazineCount reached
			for "_i" from _currentMagCount + 1 to _magazineCount do
			{
				_unit addMagazine _magazineClass;
			};
		};
	} forEach _weaponArray;
};