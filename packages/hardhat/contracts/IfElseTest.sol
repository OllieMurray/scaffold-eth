pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract ifElse {
    function foo(uint _x) public pure returns(uint){
        if(_x<10){
            return 0;
        }else if(_x<100){
            return 1;
        }else{
            return 2;
        }
    }

    function shorHandIfElse(uint _x) public pure returns(uint){
        return _x < 10?1:2;

    }



}