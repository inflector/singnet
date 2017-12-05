pragma solidity ^0.4.11;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Escrow is Ownable {


    address public beneficiary;

    event Deposited(address indexed from, uint amount);

    function Escrow(address _beneficiary)  public {
        beneficiary = _beneficiary;
    }

    function () payable  public {
        if (msg.value <= 0) {
            return;
        }

        Deposited(msg.sender, msg.value);
    }

    function releaseFunds() onlyOwner  public {
        beneficiary.transfer(this.balance);
    }
}
