pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


contract Base{
    function privateFunc() private pure returns (string memory){
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory){
        return privateFunc();
    }

    function internalFunction() internal pure returns (string memory){
        return "internal function call";
    }

    function testInternalFunction() public pure virtual returns (string memory){
        return internalFunction();
    }

    function publicFunction() public pure returns (string memory){
        return "public function call";
    }

    function externalFunction() external pure returns (string memory){
        return "external function call";
    }

    string private privateVar = "priv var";
    string internal internalVar = "int var";
    string public publicVar = "pub var";
}

contract YourContract is Base{
    //inherited funciton///
    //does not have access to private functions and state variables???

    function testInternalFunction() public pure override returns (string memory){
        return internalFunction();
    }
}