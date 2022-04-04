pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract DataLoc {

    uint[] public arr;
    mapping(uint=>address) map;
    struct MyStruct{uint foo;}

    mapping(uint=>MyStruct) myStructs;

    function f() public {
        _f(arr,map,myStructs[1]);
        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0); //oh yea, ok , this is how you initialize a struct (or one of the ways...)
    }

    //calling a functio where the inputs are from storage...? or are recorded to storage?
    //I don't see why this distiction matters yet...
    function _f(uint[] storage _arr,
        mapping(uint=>address) storage _map,
        MyStruct storage _myStruct) internal{
        
    }

    //what if the return type was storage? --> I suppose the returned value would be stored 
    //on the blockchain...
    function g(uint[] memory _arr) public returns(uint[] memory){

    }

    function h(uint[] calldata _arr) external{
        //i.e.. the 
    }


}