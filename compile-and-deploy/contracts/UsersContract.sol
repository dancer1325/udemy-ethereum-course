pragma solidity ^0.4.24;            // Specify solc's version to use

contract UsersContract {

    // Each user or account is registered uniquely by name and surname
    // struct  Reserved keyword to create structures === Go &  Rust
    struct User {
        string name;
        string surName;
    }

    // mapping(Key => Value) Visibility NameOfTheVariable
    mapping(address => User) private users;
    mapping(address => bool) private joinedUsers;
    address[] total;

    //
    function join(string name, string surName) public {
        require(!userJoined(msg.sender));
        // Ways to store variable, extracted from a mapping process
        // 1) storage
        // 1.1] All the modifications done later will be persisted
        User storage user = users[msg.sender];          // users[KeyToSearch], msg.sender is an address
        user.name = name;
        user.surName = surName;
        joinedUsers[msg.sender] = true;
        total.push(msg.sender);
    }

    // address  It's a reserved keyword in solidity --> it can't be used as name of variable
    // view     Because it's a function just to return values, no value will be modified
    // (string, string)   It's possible to return a tuple of values
    function getUser(address addr) public view returns (string, string) {
        require(userJoined(msg.sender));
        // 2) memory
        // 2.1] All the modifications done later won't be persisted
        // We are only just to query a data === not modify anything --> Use memory
        User memory user = users[addr];
        return (user.name, user.surName);
    }    

    function userJoined(address addr) private view returns (bool) {
        return joinedUsers[addr];
    }

    function totalUsers() public view returns (uint) {
        return total.length;
    }

}