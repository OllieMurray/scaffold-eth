pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract LoopTest {

    uint public i;
    uint public j;

    function forAndWhileLoopTest() public{
        for (i=0;1<10;i++){
            if (i==3){
                continue; //ok, so this is how we keep the loop going...
            }
            if(i==5){
                break; //get out of the loop
            }

        }
        j=0;
        while (j<10){
            j++;
        }
    }


}