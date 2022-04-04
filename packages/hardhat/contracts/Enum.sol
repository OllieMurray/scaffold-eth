pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract EnumsExample {
    enum Status{
        Pending, Shipped,Accepted,Rejected,Canceled
    }

    Status public status;
    //default status is zero, hence mapped to pending...
    

    //shows that enums correspond with array positions...
    function get() public view returns (Status){
        return status;
    }

    //call this using the string name or using the integer?
    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    //what is the value of status after it is deleted?
    function reset() public{
        delete status;
    }



}