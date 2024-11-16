// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RewardToken is ERC20 {
    address public admin;
 event RewardIssued(address indexed farmer, string practice, uint256 rewardAmount);
   event CarbonCreditIssued(address indexed farmer, uint256 amount, string method);
    constructor() ERC20("RewardToken", "RTK") {
        admin = msg.sender;
    }

    function issueReward(address farmer, uint256 amount) public returns (bool) {
       // require(msg.sender == admin, "Only admin can issue rewards");
        _mint(farmer, amount);
        return true;
    }
    function rewardPractice(address farmer, string memory practice, uint256 rewardAmount) public returns(bool) {
        issueReward(farmer, rewardAmount);
        emit RewardIssued(farmer, practice, rewardAmount);
        return true;
    }
     function rewardCarbonSequestration(address farmer, uint256 creditAmount, string memory method) public {
        // Issue carbon credits as reward tokens
        issueReward(farmer, creditAmount);
        emit CarbonCreditIssued(farmer, creditAmount, method);
    }
}
