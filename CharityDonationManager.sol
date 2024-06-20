// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityDonationManager {
    uint public totalDonations;
    mapping(address => uint) public donations;

    event DonationReceived(address indexed donor, uint amount);
    event DonationUpdated(address indexed donor, uint amount);

    // Function to donate with require error handling
    function donateWithRequire(uint _amount) public {
        require(_amount > 0, "Donation amount must be positive");
        donations[msg.sender] += _amount;
        totalDonations += _amount;
        emit DonationReceived(msg.sender, _amount);
    }

    // Function to update donation with assert error handling
    function updateDonationWithAssert(uint _amount) public {
        assert(_amount > 0);
        uint previousDonation = donations[msg.sender];
        donations[msg.sender] = _amount;
        totalDonations = totalDonations - previousDonation + _amount;
        emit DonationUpdated(msg.sender, _amount);
    }

    // Function to donate with revert error handling
    function donateWithRevert(uint _amount) public {
        if (_amount <= 0) {
            revert("Donation amount must be positive");
        }
        donations[msg.sender] += _amount;
        totalDonations += _amount;
        emit DonationReceived(msg.sender, _amount);
    }

    // Function to get the donation amount of a specific donor
    function getDonation(address _donor) public view returns (uint) {
        return donations[_donor];
    }
}
