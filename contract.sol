// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValueManager {
    uint public value;

    function setValueWithRequire(uint _amount) public {
        require(_amount > 0, "Amount must be positive");
        value = _amount;
    }

    function setValueWithAssert(uint _amount) public {
        assert(_amount > 0);
        value = _amount;
    }

    function setValueWithRevert(uint _amount) public {
        if (_amount <= 0) {
            revert("Amount must be positive");
        }
        value = _amount;
    }
}
