pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract Mapping2 {
    mapping(address=>mapping(uint=>bool)) public nested;

    function get(address _address, uint _i) public view returns (bool){
        bool value;
        value = nested[_address][_i];
        return value;
    }

    function set(address _address, uint _i, bool _tf) public {
        nested[_address][_i]=_tf;
    }

    //remove item... delete an integer tied to the address...
    function removeInt(address _address, uint _i) public {
        delete nested[_address][_i];

    }


    //remove item... delete the entire address record
    //cannot be applied at this level --> cannot delete the mapping that mapped to _address...!
    //hmm interesting

/*    function removeInt(address _address) public {
        delete nested[_address];

    } */


}