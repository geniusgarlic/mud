// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;
import { ISystem } from "solecs/interfaces/ISystem.sol";
import { IWorld } from "solecs/interfaces/IWorld.sol";
import { IUint256Component } from "solecs/interfaces/IUint256Component.sol";

import { EmberCrownPrototype } from "../prototypes/EmberCrownPrototype.sol";
import { EmberCrownContainerPrototype } from "../prototypes/EmberCrownContainerPrototype.sol";
import { EscapePortalPrototype } from "../prototypes/EscapePortalPrototype.sol";
import { GoldShrinePrototype } from "../prototypes/GoldShrinePrototype.sol";
import { GrassPrototype } from "../prototypes/GrassPrototype.sol";
import { TreePrototype } from "../prototypes/TreePrototype.sol";
import { WaterPrototype } from "../prototypes/WaterPrototype.sol";

uint256 constant ID = uint256(keccak256("ember.system.init2"));

contract Init2System is ISystem {
  IUint256Component components;
  IWorld world;
  address owner;

  constructor(IUint256Component _components, IWorld _world) {
    components = _components;
    world = _world;
    owner = msg.sender;
  }

  function requirement(bytes memory) public view returns (bytes memory) {
    require(msg.sender == owner, "only owner can initialize");
  }

  function execute(bytes memory) public returns (bytes memory) {
    // Initialize Prototypes
    EmberCrownPrototype(components);
    EmberCrownContainerPrototype(components, world);
    EscapePortalPrototype(components);
    GoldShrinePrototype(components);
    GrassPrototype(components);
    TreePrototype(components);
    WaterPrototype(components);
  }
}
