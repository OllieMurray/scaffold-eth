pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";


//contract that creates another contract..
//
contract Car{
    address public owner;
    string public model;
    address public carAddr;
    //should have some protections here so non one can come and jsut change the owner...
    constructor(address _owner, string memory _model) payable{
        owner=_owner;
        model=_model;
        carAddr=address(this);
    }

}

contract CarFactory{
    Car[] public cars;

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    function createAndSendEther(address _owner, string memory _model) public payable{
        Car car = (new Car){value:msg.value}(_owner,_model);
        cars.push(car);
    }

    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function create2AndSendEther(address _owner, string memory _model, bytes32 _salt) public payable{
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }


    //very interesting...
    //why is model model in memory and not in storage?  
    //when in type car model is in storage?
    //
    function getCar(uint _index) public view returns(address owner, string memory model,address carAddress, uint balance){
        Car car = cars[_index];
        return (car.owner(),car.model(),car.carAddr(),address(car).balance);   
    }

}

