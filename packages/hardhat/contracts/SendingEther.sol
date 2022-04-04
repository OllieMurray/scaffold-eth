pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

contract ReceiveEther{
    receive() external payable{}
    fallback() external payable{}
    function getBalance() public view returns (uint){
        return address(this).balance;
    } 
}

contract SendEther{
    function sendViaTransfer(address payable _to) public payable{
        _to.transfer(msg.value);
        //do not use this to send ether!
        //why?
    }

    //not recommended to send ether..
    //are these functions then recommended to do anything at all?
    function sendViaSend(address payable _to) public payable{
        bool sent = _to.send(msg.value);
        require(sent,"Failed to Send Ether");
    }
    
    function sendViaCall(address payable _to) public payable{
        (bool sent, bytes memory data) = _to.call{value:msg.value}("");//what is the part in brackets again here?
        //is this the data being sent?
        //somehting to keep an eye out for in code we review...
        require(sent,"Failed to Send Ether");
    }
}