pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


//calling parent contracts..
//ok, this is sort of a messy one...
//so we have a whole sort of section on understanding the logic of calling functions when there is inheritace..
//it is really something we jsut need to be aware of conceptually and then 
//come back to when we implement somehting like this or 
//come across it in another implementaiton...
//https://solidity-by-example.org/super/
