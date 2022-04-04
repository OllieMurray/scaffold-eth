pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/utils/Strings.sol";



contract Counter {
    uint public count;  //by default has a getter (count())
    function increment() external{
        count +=1;
    }
}

interface ICounter{
    function count() external view returns (uint);
    function increment() external;
}

//this is intereesting, cause in now where here does anything inherit or derive from the interface..
//we pass a type that a contract that is consistent with the interface counter... to 
//the counter interface, and then call the method...
//where does the interface need to be declared?? is just within the Sol Ok?
//how can we actually test this in scaffold-eth?
contract MyContract{
    function incrementCounter(address _counter) external{
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint){
        return ICounter(_counter).count();
    }

}

//ok the uniswap example is kind of cool though...
//so we might be able to see how interfaces work in e.g. rust/AS/NEAR
//if we are to take a look at 
interface UniswapV2Factory{
    function getPair(address tokenA,address tokenb) external view returns (address pair);
}
interface UniswapV2Pair{
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

//we will really be able to get an understanding of these in solidity if we make it to the
//IMM example...

//in a real world example == would we want to be able to account for changing addresses?
//would want to know how the contracts being called into to manage upgrades...
contract UniswapExample{
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns(uint, uint){
        address pair = UniswapV2Factory(factory).getPair(dai,weth); //dude what the heck... where is the pair address at?
        //I guess the factory has the implementation !  and it returns the pair...?
        //that makes sense...
        //again, the address of the pair implemented the method --> get reserves...
        //ok so maybe this is one paradigm of using interfaces ...
        //and there is another, in that you can inherit an interface?
        (uint reserve0, uint reserve1,)=UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);

    }


}











