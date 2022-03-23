pragma solidity ^0.4.24;

contract Ownable {

    //address private owner; // Not accesible from other contracts even nor contracts which extend from it
    address internal owner; // === protected. Allow being accesible from extended contracts

    constructor() public {      // By default the visibilit is public, but we can add it to remove the warning
        owner = msg.sender;
    }

    // Custom modifier
    modifier isOwner() {
        require(owner == msg.sender);
        _;                              // Callback to the method's body decorated by the custom modifier
    }
}