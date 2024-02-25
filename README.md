# Main goal
Main objective of realizing this project is to learn how proxies/upgrades_of_smart_contracts work. Also, it is nice opportunity to know how it is realized in practice, not just in theory and on images.

I have learn, that openzeppelin library has already implemented a lot of Smart Contracts to help developers to implement their own proxies safely.

# Proxy terminology:
The implementation contract = has all our code of our protocol. When we fix bugs, we launch a brand new implementation contract.
The proxy contract = which point to which implementation is the "correct" one, and routes everyone's function calls to the contract. MAIN STORAGE
The user = make calls to proxy
The admin = the user, who upgrades to new implementation contracts 


# Why initialize() is used in implementation contracts and not constructor()

When (implementation) smart contract is deployed, constructor is called -> storage of smart contract is updated.

HOWEVER, in implementation smart contract we don't want to update storage. We want to proxy contract to update storage.

Okay, but how we can deploy implementation smart contract NOT CHANGING its storage, but to change storage of proxy contract?
-> deploying implementation smart contract without empty constructor + use `initialize()` function as a constructor.
the usage of `initialize()` is best practice and the main goal: update storage of proxy smart contract via using `initialize()` func of implementation smart contract WITHOUT updating any storage of implementation smart contract    