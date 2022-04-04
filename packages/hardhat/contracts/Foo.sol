pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

struct Point{
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint){
    return x + y;
}

contract Foo{
    string public name = "Foo";
}