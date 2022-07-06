// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;
import { ISystem } from "solecs/interfaces/ISystem.sol";
import { IWorld } from "solecs/interfaces/IWorld.sol";
import { IUint256Component } from "solecs/interfaces/IUint256Component.sol";
import { getAddressById } from "solecs/utils.sol";

import { LibECS } from "std-contracts/libraries/LibECS.sol";

import { LibUtils } from "../libraries/LibUtils.sol";
import { LibStamina } from "../libraries/LibStamina.sol";

import { PositionComponent, ID as PositionComponentID, Coord } from "../components/PositionComponent.sol";
import { AttackComponent, ID as AttackComponentID, Attack } from "../components/AttackComponent.sol";
import { HealthComponent, ID as HealthComponentID, Health } from "../components/HealthComponent.sol";
import { OwnedByComponent, ID as OwnedByComponentID } from "../components/OwnedByComponent.sol";
import { StaminaComponent, ID as StaminaComponentID } from "../components/StaminaComponent.sol";

uint256 constant ID = uint256(keccak256("ember.system.combat"));

contract CombatSystem is ISystem {
  IUint256Component components;
  IWorld world;

  constructor(IUint256Component _components, IWorld _world) {
    components = _components;
    world = _world;
  }

  function requirement(bytes memory arguments) public view returns (bytes memory) {
    (uint256 attacker, uint256 defender) = abi.decode(arguments, (uint256, uint256));

    require(
      LibECS.isOwnedByCaller(OwnedByComponent(getAddressById(components, OwnedByComponentID)), attacker),
      "attacker must be owned by caller"
    );

    HealthComponent healthComponent = HealthComponent(getAddressById(components, HealthComponentID));
    require(healthComponent.has(defender), "defender has no health");

    AttackComponent attackComponent = AttackComponent(getAddressById(components, AttackComponentID));
    require(attackComponent.has(attacker), "attacker has no attack");

    Attack memory attack = attackComponent.getValue(attacker);

    PositionComponent positionComponent = PositionComponent(getAddressById(components, PositionComponentID));
    Coord memory attackerPosition = positionComponent.getValue(attacker);
    Coord memory defenderPosition = positionComponent.getValue(defender);

    int32 distanceToTarget = LibUtils.manhattan(attackerPosition, defenderPosition);
    require(distanceToTarget <= attack.range, "not in range");

    return abi.encode(attackComponent, healthComponent, attacker, defender);
  }

  function execute(bytes memory arguments) public returns (bytes memory) {
    (AttackComponent attackComponent, HealthComponent healthComponent, uint256 attacker, uint256 defender) = abi.decode(
      requirement(arguments),
      (AttackComponent, HealthComponent, uint256, uint256)
    );

    LibStamina.modifyStamina(components, attacker, -1);
    Health memory newDefenderHealth = dealDamage(attackComponent, healthComponent, attacker, defender);

    if (newDefenderHealth.current > 0 && healthComponent.has(attacker) && attackComponent.has(defender)) {
      // Check stamina after health check, because if the defender has died
      // they will not have stamina
      (int32 defenderStamina, int32 _atTurn) = LibStamina.getUpdatedStamina(components, defender);

      if (defenderStamina >= 1) {
        LibStamina.modifyStamina(components, defender, -1);
        dealDamage(attackComponent, healthComponent, defender, attacker);
      }
    }
  }

  function requirementTyped(uint256 attacker, uint256 defender) public view returns (bytes memory) {
    return requirement(abi.encode(attacker, defender));
  }

  function executeTyped(uint256 attacker, uint256 defender) public returns (bytes memory) {
    return execute(abi.encode(attacker, defender));
  }

  // ------------------------
  // Internals
  // ------------------------

  function dealDamage(
    AttackComponent attackComponent,
    HealthComponent healthComponent,
    uint256 attacker,
    uint256 defender
  ) private returns (Health memory newDefenderHealth) {
    require(attackComponent.has(attacker), "attacker has no attack");
    require(healthComponent.has(defender), "defender has no health");

    Attack memory attackerAttack = attackComponent.getValue(attacker);
    Health memory defenderHealth = healthComponent.getValue(defender);

    int32 attackStrength = attackerAttack.strength;
    if (healthComponent.has(attacker)) {
      Health memory attackerHealth = healthComponent.getValue(attacker);
      if (attackerHealth.current < attackerHealth.max) {
        attackStrength = (((attackerHealth.current * 100) / attackerHealth.max) * attackStrength) / 100;
      }
    }

    if (attackStrength > 0) {
      newDefenderHealth = calculateNewHealth(defenderHealth, attackStrength);
      healthComponent.set(defender, newDefenderHealth);

      if (newDefenderHealth.current < 0) {
        kill(defender);
      }
    }
  }

  function calculateNewHealth(Health memory health, int32 attackStrength)
    private
    pure
    returns (Health memory newHealth)
  {
    int32 remainingHealth = health.current - attackStrength;
    newHealth = Health({ current: remainingHealth, max: health.max });
  }

  function kill(uint256 entity) private {
    PositionComponent positionComponent = PositionComponent(getAddressById(components, PositionComponentID));
    if (positionComponent.has(entity)) {
      positionComponent.remove(entity);
    }

    HealthComponent healthComponent = HealthComponent(getAddressById(components, HealthComponentID));
    if (healthComponent.has(entity)) {
      healthComponent.remove(entity);
    }

    StaminaComponent staminaComponent = StaminaComponent(getAddressById(components, StaminaComponentID));
    if (staminaComponent.has(entity)) {
      staminaComponent.remove(entity);
    }
  }
}
