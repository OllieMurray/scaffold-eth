pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


//calling another contract..
//calling antoher contract set in the same solidity file?

contract Callee{
    uint public x;
    uint public value;
    function setX(uint _x) public returns (uint){
        x=_x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint){
        x=_x;
        value=msg.value;
        return (x,value);
    }
}

contract Caller{
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);

        callee.setX(_x);
    }

    //interesting syntax here... is the value variable on the left unrelated to the value variable in the right?
    //is the 'value' the last item returned when ether is sent during a funciton vall? --> no, look at the return 
    //signature of setXandSendEther --> that is waht determines the order...
    
    function setXandSendEther(Callee _callee, uint x) public payable{
        (uint x, uint value) = _callee.setXandSendEther{value:msg.value}(_x);
    }

}
