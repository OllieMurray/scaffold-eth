pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract ViewAndPure {
    uint x = 1;
    
    //promise not to modify the state...
    function readOnly() public view returns (uint) {
        return x;
    }

    //promise not to read or mod from state...
    function workOnly(uint y, uint j) public pure returns (uint) {
        return y*j;
    }
}