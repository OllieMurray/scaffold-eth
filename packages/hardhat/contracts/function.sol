pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract functionTest {
    //
    function returnMany() public pure returns(uint,bool,uint){
        return (1,true,2);  //notice the syntax for true
    }
    //pure, does not touch blockchain at alll

    function named() public pure returns(uint var1, bool var2, int var3){
        return(1,true,2);
    }
    
    //omitting the return statement using named variables...
    function omitRetrun() public pure returns (uint var1, bool var2, uint var3){
        var1 = 1; var2 = true; var3 = 2;
    }

    //dealing with functions that return multiple values...
    function dealingMultReturns() public pure returns(uint, bool, uint, uint, uint){
        (uint i, bool b, uint j) = returnMany();  //what would have happened if we used named()?
        (uint x, , uint y) = (4,5,6); //this is like working with a sort of array without declaring an array...
        return (i,b,j,x,y);

    }


    uint[] public arr; //remember, functions can only declare fixed length arrays!
    //using arrays for input and output...
    function arrayInput(uint[] memory arrayIn) public returns(uint[] memory){
        arr = arrayIn;
        return arr;
    }


}