pragma solidity >=0.5.0 <0.7.0;

contract OrderDetails {
    
    string public orderNumber;

    struct Address {
        string name;
        string postalCode;
    }
    
    struct Status {
        uint256 createdOn;
        string  statusCode;
    }
    
    
    address private orderCreator;
    Address private senderAddress;
    Address private receiverAddress;

    event NewStatusGeneration(uint256 indexed eventTime, string statusCode);

    constructor(string memory senderName,
        string memory senderPostalCode,
        string memory receiverName,
        string memory receiverPostalCode,
        string memory number) public {
        senderAddress = Address(senderName, senderPostalCode);
        receiverAddress = Address(receiverName, receiverPostalCode);
        orderCreator = msg.sender;
        orderNumber = number;
    }

    function addEvent(uint256 eventTime, string memory statusCode) public {
        emit NewStatusGeneration(eventTime, statusCode);
    }


    function ownAddress() view public returns(address) {
        return address(this);
    }
    
    
    function getOrderDetails() view public returns(string memory outSenderName,
        string memory outSenderPostalCode,
        string memory outReceiverName,
        string memory outReceiverPostalCode,
        string memory number
    ) {
        return (senderAddress.name,
        senderAddress.postalCode,
        receiverAddress.name,
        receiverAddress.postalCode,
        orderNumber);
    }
}