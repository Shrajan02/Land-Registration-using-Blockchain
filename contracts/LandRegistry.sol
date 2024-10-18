// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    struct Land {
        uint id;
        string owner;
        string location;
        uint size;
        bool isRegistered;
    }

    mapping(uint => Land) public lands;
    uint public landCount;

    event LandRegistered(uint id, string owner, string location, uint size);

    // Function to register a new piece of land
    function registerLand(string memory _owner, string memory _location, uint _size) public {
        landCount++; // Increment landCount before assigning
        lands[landCount] = Land(landCount, _owner, _location, _size, true);
        emit LandRegistered(landCount, _owner, _location, _size);
    }

    // Function to get details of a land by its ID
    function getLand(uint _id) public view returns (Land memory) {
        require(_id <= landCount, "Land does not exist.");
        return lands[_id];
    }
}
