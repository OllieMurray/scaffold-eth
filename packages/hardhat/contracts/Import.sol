pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


import "./Foo.sol";

import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import{
    Foo public foo = new Foo();
    function getFooName() public view returns  (string memory){
        return foo.name();
    }
}
