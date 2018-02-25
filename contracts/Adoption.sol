pragma solidity ^0.4.17;

contract Adoption {

  address[16] public adopters;

  //Adopting a pet
  function adopt(uint petId) public returns (uint){
      require(petId >=0 && petId <= 15);

      adopters[petId] = msg.sender;

      return petId;
  }

  //returning all the people who have adopted 
  function getAdopters() public view returns (address[16]){
    return adopters;
  }
}
