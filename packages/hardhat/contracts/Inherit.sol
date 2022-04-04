
//messing around with inheritance
contract A{
    function foo() public pure virtual returns (string memory){
        return "A";
    }

}

//notice the use of override ... override functions from inherited classes...

contract B is A {
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}


contract C is A{
    function foo() public pure virtual override returns (string memory){
        return "C";
    }
}

//need to override a both parents..
//does the order matter?
//notice how it is no longer a virtual function?  why?

//will call "C" since this is the right most parent contract...
contract D is B, C{
    function foo() public pure override(B,C) returns (string memory){
        return super.foo();
    }
}

//will call "B" since right most
contract E is C,B {
    function foo() public pure override(C,B) returns (string memory){
        return super.foo();
    }
}

contract F is A, B{
    //throw comp error, must ineherit upwards the inheritance tree.. from closest contract to most derived...
    //or most original at the end
    function foo() public pure override(A,B) returns (string memory){
        return super.foo();
    }
}
