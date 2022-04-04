pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract YourEvents {
    //index - to help filter the log...
    //we should see what tools are used to filter logs etc...
    //up to three parameters can be indexed?
    event Log(address indexed sender, string );
    event AnotherLog();

    function test() public{
        emit Log(msg.sender,"Hello");
        emit Log(msg.sender,"EVM");
        emit AnotherLog();

        //what were the events used in crypto zombies? --> somehting like another zombie was creat4ed..
        //what other data can be stored in the log, a struct, an array?
   }

}