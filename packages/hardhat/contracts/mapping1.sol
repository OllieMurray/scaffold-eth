pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract Mapping1 {
    mapping(address=>uint) public map;
    function get(address _address) public view returns (uint){
        uint value;
        value = map[_address]; 
        return value;
    }

    //what happens when I call with an address not in the mapping? -- get zero, if trying to remove an address that isn't there, nothing
    //what happens if _address isn't actually an address? --> eror thrown
    //what is the siz limit of map?

    function set(address _address, uint value) public {
        map[_address]=value;
    }

    function remove(address _address) public {
        delete map[_address];  //interesting synta
        //what error is thrown if the address does not exist?
    }


}