pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//delegate call..
//but this does not seem to be exhaustive in terms of how delegates are used..
//I think we have se
contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable{
        num=_num;
        sender = msg.sender;
        value = msg.value;

    }
}

contract A{
    uint public num;
    address public sender;
    uint public value;
    function setVars(address _contract, uint _num) public payable {
        (bool success,bytes memory data)=_contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
    }
}