pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//abi encode...
//encode data in bytes
//abi decode.. decode bytes back to data...

contract AbiDecode{
    struct MyStruct{
        string name;
        uint[2] nums;
    }

    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    )external pure returns (bytes memory){
        return abi.encode(x,addr,arr,myStruct);
    }

    function decode(bytes calldata data) external pure returns (uint x, address addr, uint[] memory arr, MyStruct memory myStruct){
        (x,addr,arr,myStruct)=abi.decode(data,(uint,address,uint[],MyStruct));

    }

}