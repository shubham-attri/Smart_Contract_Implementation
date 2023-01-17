pragma solidity >= 0.4.22 <0.9.0;

contract smartcontract{
    address  public owner;
    bytes32 public transactionId;
    string public message;
    uint public timestamp;
    uint private fundBalance;
    string public activity;

    // Set the fund balance and activity in the constructor
    constructor(uint _fundBalance, string memory _activity) public {
        owner = msg.sender;
        message = "Initialisation of the smartcontract for fundTracker";
        transactionId = tx.hash;
        activity = _activity;
        timestamp = block.timestamp;
    }

    // Set the bool for access modifiers to the functions to be only accessed by owner
    function isOwner() private view returns (bool) {
        return msg.sender == owner;
    }

    // Transfer the ownership to a new address
    function transferOwnership(address _newOwner) private isOwner{
        require(isOwner(), "Only the owner can call this function");
        owner = _newOwner;
    }

    // Update the transaction ID to the current transaction's hash
    function updateTransactionId() public {
        transactionId = tx.hash;
    }

    // Update the timestamp to the current block's timestamp
    function updateTimestamp() public{
        timestamp = block.timestamp;
    }

    // A function to update the fund balance and only the owner can access or update this
    function updateFundBalance(uint _fundBalance) public isOwner{
        fundBalance = _fundBalance;
    }

    // A function to update the activity and can only be accessed by the owner
    function updateActivity(string memory _activity) public isOwner{
        activity = _activity;
    }

    // A function to withdraw funds for the specified activity
    function withdrawFunds(uint _amount, string activity) public {
        // Check if the requested amount is less than or equal to the fund balance
        require(_amount <= fundBalance, "Insufficient funds");
        if(activity == _activity){
             // Update the fund balance
            fundBalance -= _amount;
            updateTimestamp();
        }
    }
}

