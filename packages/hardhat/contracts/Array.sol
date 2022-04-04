pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract Array {
    uint[] public arr;
    uint[] public arr2 = [1,2,3];
    uint[10] public myFixedSizeArray;

    function get(uint _i) public view returns (uint){
        return arr[_i];
    }

    //view funciton auto executed in UI...
    function getArr() public view returns(uint[] memory){
        return arr; //how is this going to be treated in scaffold-eth?
    }

    function pushElemetn(uint _i) public {
        arr.push(_i);
    }

    function poplastelement() public{
        arr.pop();
    }


    function getLength() public view returns (uint){
        return arr.length;
    }

    function deleteElement(uint _i) public{
        delete arr[_i];  //confirmed, sets value of deleted element equal to zero...
    }

    function example() external pure returns(uint[] memory){
        //interesting, only a fixed size array can be created in memory...
        //this is wht was giving us problems when we were trying to modify some of the earlier code..
        uint[] memory localArr = new uint[](5);
        localArr[3]=3;
        return localArr;
    }

    //interesting, in the hardhat app, the pure function just seems to have been executed automatically..
    //seems to be the treatment for view functions with  no arguments....




}