// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


//initializing a contract named token_assignment
contract TOKEN_ASSIGNMENT{
    //a mapping of addresses to balance
    mapping (address => uint256) public balanceOf;

    //a custom error: thrown when the transaction initiator is not owner of the contract
    error TOKEN_ASSIGNMENT__NotOwner();
    //a custom error: thrown when the sender has not enough balance to transfer
    error TOKEN_ASSIGNMENT__NotEnoughBalanceToTransfer();

    //public variable to store owner's address
    address public owner;
    //public variable to store total supply of the token
    uint256 public totalSupply;

    //emitted when any transfer happens
    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor(){
        //set the contract owner's address in the public variable
        owner = msg.sender;
    }

    //a modifier to make sure the function valler is owner
    modifier onlyOwner{
        if(msg.sender != owner) revert TOKEN_ASSIGNMENT__NotOwner();
        _;
    }

    //mint function:
    //@param: amount = the amount to be minted
    function mint(address to, uint256 amount) public onlyOwner{
        //increase the supply variable
        totalSupply += amount;

        //increase the balance of the address where we're minting the token
        balanceOf[to] += amount;
    }

    //@param: to = whom to send the token
    //@param: amount = how much token to send
    function transfer(address to, uint256 amount) public {
        //rever the transaction if balance is not enough
        if(balanceOf[msg.sender] < amount) revert TOKEN_ASSIGNMENT__NotEnoughBalanceToTransfer();

        //decresed balance of sender
        balanceOf[msg.sender] -= amount;

        //increased balance of receiver
        balanceOf[to] += amount;

        //this line emits an event which will be used to listen to all transfers
        emit Transfer(msg.sender, to, amount);
    }
}