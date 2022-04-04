pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

contract Fallback{
    event Log(uint gas);
    fallback() external payable{
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint) {
        
    }
}

contract SendToFallBack{
    function transferToFallback(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable{
        (bool sent,) = _to.call{value:msg.value}("");
        require(sent, "Failed to Send Ether");
    }
}