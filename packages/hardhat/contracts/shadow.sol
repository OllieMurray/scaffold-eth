pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


contract A{
    //shadoow inherited state variables...
    string public name = "Contract A";
    function getName() public view returns (string memory){
        return name;
    }

}


contract YourContract is A{
    //shadoow inherited state variables...
    constructor(){
        name  = "Contract C";
    }
    //the correct way to override inherited state variables...

}