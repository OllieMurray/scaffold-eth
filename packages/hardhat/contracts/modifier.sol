pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract YourModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"not owner this is bogus");
        _;

    }


    modifier validAddress(address _addr){
        require(_addr!=address(0),"not valid address, cannot be zero");
        _;
    }

    //could we modify the above so only those adddresses stored in a particular array can become the owner?

    //cannot move the address to zero address
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
        owner = _newOwner;
    }

    modifier noReentrancy(){
        require(!locked,"No Rentrancy");
        locked=true;
        _;
        locked=false;
    }

    function decrement(uint i) public noReentrancy{
        x-=i;
        if (i>1){
            decrement(i-1);   //interesting, so it is possible to have recursive functions..
            //but perhaps we stop this with the renetrancy gaurd...
        }
    }



}