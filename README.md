# Clisha Chain Setup for Nodes, Validators & RPC Services


- Visit [What is Clisha Chain](https://clishachain.com/) page to know more about us.

This page contains technical information needed to add a node on ClishaChain 

## System requirements

**Operating System**: Ubuntu 22.04 LTS 64 bits

**Hardware**:

| Hardware       | minimum | desired |
| :------------- | :------ | :------ |
| **CPU's**:     | 2       | 4       |
| **Memory**:    | 4 Gb    | 8 Gb    |
| **Hard Disk**: | 100 Gb  | 1000 Gb |

### TCP/UDP PORTS

You'll need to open the following ports in both ways to deploy a node:

#### Validator Node

| Port  | Type |      To       | Definition                                   |
| :---: | :--: | :-----------: | :------------------------------------------- |
| 30303 | TCP  |    0.0.0.0    | Ethereum client listener and discovery ports |
| 30303 | UDP  |    0.0.0.0    | Ethereum client listener and discovery ports |


#### Regular/RPC Node

| Port  | Type |                 To                  | Definition                                   |
| :---: | :--: | :---------------------------------: | :------------------------------------------- |
| 30303 | TCP  |               0.0.0.0               | Listener and discovery ports                 |
| 30303 | UDP  |               0.0.0.0               | Listener and discovery ports                 |
| 8545  | TCP  | 0.0.0.0 (this can be internal only) | RPC HTTP Port                                |
| 8546  | TCP  | 0.0.0.0 (this can be internal only) | RPC WS Port                                  |


## Installation & configuration

### Server Setup

Start with server setup in the _server_ directory

- [Server Setup Guide](server/setup.md)

### Regular node

Use the _regular_ directory

- [Regular node Installation Guide](regular/Installation.md)

### RPC node

Use the _rpc_ directory

- [RPC and WebSocket Guide](rpc/Installation.md)

### Validator node

Use the _validator_ directory

- [Validator node Installation Guide](validator/Installation.md)


## Important links

- [Mainnet Block Explorer](http://clishascan.com)
- [Testnet Block Explorer](http://testnet.clishachain.com/)
- [Download Clisha Chain Binary](https://github.com/ClishaChain/ClishaChain/releases/download/v24.6.0/besu-24.6.0.zip)
