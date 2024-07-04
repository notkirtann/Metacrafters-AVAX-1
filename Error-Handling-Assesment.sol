// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FootballClub {
    address public owner;
    uint256 public playerCount;

    struct  Player {
        uint256 id;
        string name;
        uint256 age;
        uint256 price;
        bool isAvailable;
    }

    mapping(uint256 => Player) public players;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    event PlayerAdded(uint256 id, string name, uint256 age, uint256 price);
    event PlayerUpdated(uint256 id, string name, uint256 age, uint256 price, bool isAvailable);

    function addPlayer(uint256 _id, string memory _name, uint256 _age, uint256 _price) public onlyOwner {
        require(_price > 0, "Price must be greater than zero");
        require(_age > 0, "Age must be greater than zero");

        players[_id] = Player(_id, _name, _age, _price, true);
        playerCount++;

        emit PlayerAdded(_id, _name, _age, _price);
    }

    function updatePlayer(uint256 _id, string memory _name, uint256 _age, uint256 _price, bool _isAvailable) public onlyOwner {
        require(_price > 0, "Price must be greater than zero");
        require(_age > 0, "Age must be greater than zero");

        Player storage player = players[_id];
        if (bytes(player.name).length == 0) {
            revert("Player does not exist");
        }

        player.name = _name;
        player.age = _age;
        player.price = _price;
        player.isAvailable = _isAvailable;

        emit PlayerUpdated(_id, _name, _age, _price, _isAvailable);
    }

    function getPlayer(uint256 _id) public view returns (string memory, uint256, uint256, bool) {
        Player storage player = players[_id];
        require(bytes(player.name).length > 0, "Player does not exist");
        return (player.name, player.age, player.price, player.isAvailable);
    }

    function totalPlayers() public view returns (uint256) {
        assert(playerCount >= 0);
        return playerCount;
    }
}
