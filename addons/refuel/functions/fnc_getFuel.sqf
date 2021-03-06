/*
 * Author: GitHawk, Jonpas
 * Get the remaining fuel amount.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Fuel left (in liters) <NUMBER>
 *
 * Example:
 * [fuelTruck] call ace_refuel_fnc_getFuel
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]]];

if (isNull _target) exitWith {0};

private _fuel = _target getVariable QGVAR(currentFuelCargo);

if (isNil "_fuel") then {
    _fuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(fuelCargo));
    _target setVariable [QGVAR(currentFuelCargo), _fuel, true];
};

_fuel
