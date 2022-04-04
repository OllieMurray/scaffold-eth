pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract X {
    //use require validate, inputs, returns from calls to other functions, conditions before execution...
    string public name;
    constructor(string memory _name){
        name = _name;
    }

}

contract Y {
    //use require validate, inputs, returns from calls to other functions, conditions before execution...
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}


//two ways to initialize parent contract with parameters...
//in the intheritance spec...
//in the constructor...

contract B is X("Input to X"), Y("Input to Y"){

}

contract C is X,Y {
    constructor(string memory _name, string memory _text) X(_name)Y(_text){}
}

//order of constructors called is always from left to right...
//not sure why there is an error here...
//order --> X, Y and then D
 contract YourContractTemp is X,Y{
     constructor() X("X was called") Y("Y was called"){}
 }

//order is still, X, Y, and E...
contract YourContract is X,Y {
    constructor() Y("Y was called") X("X was called"){}
}