// First line it's to indicate compiler's version to use
//pragma solidity ^0.4.24;    // Take care of the compiler's version, since it could be not backward compatible
// It doesn't work if we use a newer compiler's version

//pragma solidity ^0.8.7;
pragma solidity ^0.4.24;

import "./Ownable.sol";

// contract  It's a reserved keyword to define smart contracts
//contract MessageStore{
contract MessageStore is Ownable{               // Extends the contract
    // Typical variable to create in a smart contract to store the smart contract's owner === who's executing the transaciton into the net
    //address private owner;      // It's delegated to the extended contract

    // To store the message
    string private message;
    
    // Constructor
    // It's the first part of the contract which will be executed each time
    //constructor() {             // By default the visibility is public
    // // It's delegated to the extended contract
    //constructor () public {
    //    owner = msg.sender;             // Person who's executing the transaction in the moment to go through the code
    //}

    // Function to store in the global variable the message
    // 1) If pragma solidity ^0.4.24;
    function setMessage(string newMessage) public payable isOwner {     // Not required to use 'memory' keyword
        require(msg.value >= 3 ether);                                  // msg. value  Another predefined variable, about the required amount to send each time in the execution of the method
        message = newMessage;
            
    // 2) 
    // function setMessage(string memory) public isOwner {
        // message = newMessage; // If we switch to the reserver keyword memory, it doesn't exist
        //     message = memory; // It doesn't work because they aren't the same value --> How to send values?
    }

    // Another function which requires value to be used, and it can be used by anyone
    function setMessageByAnyone(string newMessage) public payable {
        require(msg.value >= 6 ether);                                  // msg. value  Another predefined variable, about the required amount to send each time in the execution of the method
        message = newMessage;
    }

    //view. - Function isn't used to store any value in the contract, neccesary for that to mine a transaction
    // Display the transaction
    // returns (DataTypeToReturn)
    function getMessage() public view returns (string memory) {
        // "memory" - Keyword required to use https://stackoverflow.com/questions/58258808/data-location-must-be-memory-for-return-parameter-in-function-but-none-was-gi
        return message;
    }

    // Custom modifier
    // Decorate a method
    
    // 1) Add here in this contract
    // modifier isOwner() {
    //    require(owner == msg.sender);
    //    _;                              // Callback to the method's body decorated by the custom modifier
    //}

    // 2) Import from another contract


    // Get contract's balance
    function getBalance() public view returns (uint) {     // view.  Because it only reads contract's information
        //return this.balance;                // Valid in older versions
        return address(this).balance;     // this === contract --> address. By default the units are wei
    }

    function getEtherBalance() public view returns (uint) {
        return getBalance() / 1e18;             // Converse wei --> ether
    }

    // Transfer money from contract's balance to contract's owner
    function transfer(uint amount) public isOwner {
        // Condition that the contract's balance is higher than the amount to transfer
        // Units by default of balance is wei --> We would need to pass wei as amount
        require(address(this).balance >= amount);

        owner.transfer(amount);
    }

    
    // Transfer money from contract's balance to an address specified
    function transfer(uint amount, address to) public isOwner {
        // Condition that the contract's balance is higher than the amount to transfer
        // Units by default of balance is wei --> We would need to pass wei as amount
        require(address(this).balance >= amount);
        // Condition for just Ethereum accounts
        require(to != address(0));

        to.transfer(amount);
    }
}
