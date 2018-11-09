const IPFSInbox = artifacts.require("./IPFSInbox.sol");

contract("IPFSInbox", accounts => {
  it("...should store the value 89.", async () => {
    const ipfsInbox = await IPFSInbox.deployed();

    eventEmitted = false
    var event = ipfsInbox.ipfsSent()
        await event.watch((err, res) => {
            eventEmitted = true
        })

    // Set value of 89
    await ipfsInbox.sendIPFS(accounts[1], "SampleAddress", { from: accounts[0] });

    assert.equal(eventEmitted, true, "Sending an IPFS request does not emit an event.");
  });
});
