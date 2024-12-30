// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV3 is Initializable {
    // State variables (inherited from V2)
    uint public numSodas;
    address public owner;

    // New state variable for tracking soda purchases
    mapping(address => uint) public sodasPurchased;

    function initialize(uint _numSodas) public initializer {
        numSodas = _numSodas;
        owner = msg.sender;
    }

    function purchaseSoda() public payable {
        require(msg.value >= 1000 wei, "You must pay 1000 wei for a soda!");
        require(numSodas > 0, "No sodas left to purchase!");

        numSodas--;
        sodasPurchased[msg.sender]++; // Track the purchase
    }

    function withdrawProfits() public onlyOwner {
        require(
            address(this).balance > 0,
            "Profits must be greater than 0 in order to withdraw!"
        );
        (bool sent, ) = owner.call{value: address(this).balance}("");
        require(sent, "Failed to send ether");
    }

    function setNewOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    function getPurchases(address user) public view returns (uint) {
        return sodasPurchased[user];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }
}
