pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract YourError {
    //use require validate, inputs, returns from calls to other functions, conditions before execution...
    
    function testReq(uint _i)  public pure{
        require(_i>10,"input must be greater than 10");
    }

    function testRevert(uint _i) public pure{
        //use for complex conditions
        if(_i<=10){
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    //assert for internal errors only...
    //for example, shoudl be impossible to update this value, so if it was updated then  serious error has occured...
    //
    function testAssert() public view{
        assert(num==0);
    }

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view{
        uint bal = address(this).balance;
        if(bal<_withdrawAmount){
            revert InsufficientBalance({balance:bal, withdrawAmount: _withdrawAmount}); //basically declare a custom error...
        }
    }

}