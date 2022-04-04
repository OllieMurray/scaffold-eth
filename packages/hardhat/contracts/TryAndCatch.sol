pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


//try catch exammple...
//
contract Foo{
    address public owner;
    constructor(address _owner){
        require(_owner!=address(0),"invalid address");
        assert(_owner!=0x0000000000000000000000000000000000000001);
        owner=_owner;

    }

    function myFunc(uint x) public pure returns (string memory){
        require(x!=0,"require failed");
        return "my func was called";
    }
}

Contract Bar{
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor(){
        foo = new Foo(msg.sender);
    }

    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result){
            emit Log(result);
        } catch{
            emit Log("external call failed");
        }
    }

    function tryCatchNewContract(address _owner) public{
        try new Foo(_owner) returns (Foo foo){
            //as with try catch ext call..
            //can use newly created foo here
            emit Log("foo created");
        }catch Error(string memory reason){
            //where does error type come from?
            //where does reason come from?
            emit Log(reason);
        }catch (bytes memory reason){
            //is it possible to through differnt types of errors here or something?
            //some being string, some being bytes?
            emit LogBytes(reason);
        }
    }

}