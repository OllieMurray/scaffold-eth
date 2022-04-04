pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//abi encode...
//encode data in bytes
//abi decode.. decode bytes back to data...


//
contract Hashing{
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_text,_num,_addr));
    }

    function collision(string memory _text, string memory _anotherText) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_text,_anotherText));
    }
}

contract GuessTheMagicWord{
    bytes32 public answer = 0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    function guess(string memory _word) public view returns (bool){
        return keccak256(abi.encodePacked(_word))==answer;
    }
}