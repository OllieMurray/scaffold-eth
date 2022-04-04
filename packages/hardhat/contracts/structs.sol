pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";

//messing around with variable types and visibility....
contract Structs {
   

struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;  //an array of structs... think back to crypto zombies?  yes.

    function create(string memory _text) public {
        //differnt ways to initialize a struct...


        todos.push(Todo(_text,false));
        
        //similar to e.g. function calls from the CLI in NEAR
        todos.push(Todo({text:_text,completed:false}));

        //
        Todo memory todo; //only in memory for the life of the function call... not written to storage...
        todo.text=_text;
        todos.push(todo);
    }

    //solidity automatically creates getters -- verify tjhijs is the case... - but since it is kept in an array...
    //doesn't matter, seems like getter already created...
    function get(uint _index) public view returns (string memory text, bool completed){
        Todo storage todo = todos[_index]; //why is this storage?    because it is pulling from storage?
        return (todo.text, todo.completed); //notice how we return the values, we don't return a struct, we return the values from the struct
    }

    //update text...
    function updateText(uint _i, string memory _text) public {
        Todo storage todo = todos[_i];
        todo.text = _text; //because it is writing to an element that is kept in storage..
    }

    //update state i.e. completed variable... is it completed or not type thing...
    function toggleCompleted(uint _i) public {
        Todo storage todo = todos[_i];
        todo.completed = !todo.completed;
    }


}