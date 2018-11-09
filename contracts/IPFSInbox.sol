pragma solidity ^0.4.23;

contract IPFSInbox {

    // Grabs the name of the resources based on address
    mapping (address => string) ipfsInbox;

    // Events
    event ipfsSent(string _ipfsHash, address _address);
    event inboxResponse(string response);

    // Modifiers
    modifier notFull (string _string) {bytes memory stringTest = bytes(_string); require (stringTest.length == 0); _;}

    constructor() public {

    }

    function sendIPFS(address _address, string _ipfsHash)
        notFull(ipfsInbox[_address])
        public
    {   
       ipfsInbox[_address] = _ipfsHash;
       emit ipfsSent(_ipfsHash, _address);
    }
    
    function checkInbox()
        public
    {
        string memory ipfs_hash = ipfsInbox[msg.sender];
        if(bytes(ipfs_hash).length == 0) {
            emit inboxResponse("Empty Inbox");
        } else {
            ipfsInbox[msg.sender] = "";
            emit inboxResponse(ipfs_hash);
        }
    }
}