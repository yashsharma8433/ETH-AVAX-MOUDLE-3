// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyNameToken {
    string public tokenName = "YASHSHARMATOKEN";
    string public tokenSymbol = "YSTKN";
    uint256 public decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;
    address public contractOwner;

    modifier owneronly() {
        require(msg.sender == contractOwner);
        _;
    }

    constructor() {
        contractOwner = msg.sender;
        totalSupply = 18; // Set an initial total supply
        balances[contractOwner] = totalSupply; // Assign all tokens to the contract owner initially
    }

    function mint(address recipient, uint256 amount) external owneronly {
        balances[recipient] += amount;
        totalSupply += amount;
    }

    function transfer(address recipient, uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance error"); 

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }

    function burn(uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance error");

        balances[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
