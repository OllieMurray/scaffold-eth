// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.10 and less than 0.9.0
pragma solidity >=0.8.0 <0.9.0;
import "hardhat/console.sol";

contract YourContractOriginal {
      event SetPurpose(address sender, string purpose);

      string public purpose = "Building Unstoppable Apps!!!";

      constructor() payable {
        // what should we do on deploy?
      }

      function setPurpose(string memory newPurpose) public {
          purpose = newPurpose;
          console.log(msg.sender,"set purpose to",purpose);
          emit SetPurpose(msg.sender, purpose);
      }

      // to support receiving ETH by default
      receive() external payable {}
      fallback() external payable {}

}