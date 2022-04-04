pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

contract Payable{
    //payable address can receive ether --> i.e. though interacting with the contract..
    //someone can send ether directly to the owner...?
    address payable public owner;
    constructor() payable {
        owner = payable(msg.sender); //why is payable being used here like a method.,.?
    }

    //is this almost sort of being used like a fall back function?
    //no implementation here... just utilizing the fact that it is payable to deposit funds...
    //into the contract...
    function deposit() public payable{}
    function nonPayable() public {}

    function withdraw() public {
        uint amount = address(this).balance; //so does balance always exist as a variable in all contracts?

        //send all ether to owner...
        //is this currently the best practice for sending eth?
        //i.e. using the function 'call?' --> I think it is...
        //but I think it is bad practice to call methods with signatures  using this...
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");

    }

    function transfer(address payable _to, uint _amount) public {
        //interesting to note that _to is declared as payable..
        //this is probably not the safest... should check value against balance...
        //should we decrement balance?  or does this occur automatically?
        //ie. is there built in logic for managing the balance..
        //just like there is built in logic for e.g. gasleft()?
        
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }


}