pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  function testUserCanAdoptPet() public {
    uint expected = 8;
    uint actual = adoption.adopt(8);

    Assert.equal(actual, expected, "Adoption of pet ID 8 should be recorded.");
  }

  function testGetAdopterAddressByPetId() public {
    address expected = this;
    address actual = adoption.adopters(8);

    Assert.equal(actual, expected, "Owner of pet ID 8 should be recorded.");
  }

  function testGetAdoptersAddressByPetIdInArray() public {
    address expected = this;

    address[16] memory adopters = adoption.getAdopters();
    address actual = adopters[8];

    Assert.equal(actual, expected, "Owner of pet ID 8 should be recorded.");
  }
}
