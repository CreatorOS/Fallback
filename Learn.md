# Fallback

`fallback` is a function that does not take any arguments and does not return anything.

It is executed either when

- a function that does not exist is called or
- Ether is sent directly to a contract but `receive()` does not exist or `msg.data` is not empty

`fallback` has a 2300 gas limit when called by `transfer` or `send`.

Code this `fallback()` function in `Fallback` contract:

```
        fallback() external payable {}
```

Note that `fallback()` function has to be `external`.

Also, write this test function in `Fallback` contract:

```
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
```

## Sending ether to fallback

Let's now send `ether` to `Fallback` contract.
Code this up in `SendToFallback` contract:

```
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }
```

Here we are just sending the `ether` to `_to` address using `transfer()` function.

Hit `Run`.
It should run a script to call this `transfertoFallback()` with the address of the `Fallback` contract and 1 ether.
If you wrote the `fallback()` function correctly the logs should show the balance of the `Fallback` increased after transfer.
