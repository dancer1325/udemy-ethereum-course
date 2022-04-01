//pragma solidity ^0.4.24;            // Specify solc's version to use. Problem: We were getting errors with  old versions
pragma solidity ^0.8.6;               // Updated versions

contract UsersContract {

    // Each user or account is registered uniquely by an address, which we link a name and surname to
    // struct  Reserved keyword to create structures === Go &  Rust
    struct User {
        string name;
        string surName;
    }

    // mapping(Key => Value) Visibility NameOfTheVariable
    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    address[] total;

    // event        Define an event
    // onUserJoined                     Name of the event
    // address, string                  Data type to emit in the event
    event onUserJoined(address, string);

    // Join an User to the contract
    //    function join(string name, string surName) public {                   // Old versions (at least 0.4.24)
    function join(string memory name, string memory surName) public {       // New versions (at least 0.8.6). Required to add data location
        require(!userJoined(msg.sender));               // Check not to join twice an user
        // Ways to store variable, extracted from a mapping process
        // 1) storage
        // 1.1] All the modifications done later will be persisted
        User storage user = users[msg.sender];          // users[KeyToSearch], msg.sender is an address. Account in Remix
        user.name = name;
        user.surName = surName;
        joinedUsers[msg.sender] = true;                 // Add to the Map
        total.push(msg.sender);                         // Add elements to the array
        emit onUserJoined(msg.sender, string(abi.encodePacked(name, " ", surName)));     // Emit the event onUserJoined
        //        onUserJoined(msg.sender, string(abi.encodePacked(name, " ", surName)));     // emit is required as prefix
        // string(abi.encodePacked(StringsToConcat))    Concatenate strings
    }

    // address  It's a reserved keyword in solidity --> it can't be used as name of variable
    // view     Because it's a function just to return values, no value will be modified
    // (string, string)   It's possible to return a tuple of values
    //    function getUser(address addr) public view returns (string, string) {                         // Old versions (at least 0.4.24)
    function getUser(address addr) public view returns (string memory, string memory) {             // New versions (at least 0.8.6). Required to add data location
        require(userJoined(msg.sender));
        // 2) memory
        // 2.1] All the modifications done later won't be persisted
        // We are only just to query a data === not modify anything --> Use memory
        User memory user = users[addr];
        return (user.name, user.surName);
    }

    // private  Only accessible within the contract
    function userJoined(address addr) private view returns (bool) {
        return joinedUsers[addr];           // If the key doesn't exist --> It returns a boolean
    }

    function totalUsers() public view returns (uint) {
        return total.length;
    }

}