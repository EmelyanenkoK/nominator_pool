[![Testing status](https://img.shields.io/badge/testing-in%20progress-red.svg)](https://github.com/newton-blockchain) 
[![made-with-funC](https://img.shields.io/badge/Made%20with-funC-a3428f.svg)](https://github.com/newton-blockchain/ton/tree/master/crypto/smartcont)

# Nominators
Nomination is an important mechanism of network decentralization (2.6.3 [ton.pdf](ton.org/ton.pdf)) 
which essentially decouple computing/bandwidth capacity from "capital" and thus substantially decrease
the threshold of joining the validation process for all parties.

This repository presents a smart-contract (software deployed on-chain) of such nominator pool for the original TON network.

# Modules
Nomination system has modular structure and consists of number of contracts.
1. Validator-controller
   * Controller fronts 
2. Profit-pool

# Validator controller
Validator controller is smart-contract that ensures that validator use money for validation only, checks parameters of validation and distribute validation profit/loss between validator and one nominator. Note that it is possible, but not required, that nominator is pool-like contract (see below). 

## Trust model
Nominator (actor whio lend money) and Validator (actor who validate network) share the risk.
If Validator does his job correctly he gains rewards for himself and nominator.
Otherwise, upon misbehavior Validator gets fined, that is loses toncoins. Controller contract has `cover_ability` parameter which controls which minimal part of recommended fine will be covered from validator's acccount. Accordingly `1 - cover_ability` part of the fine will be covered by nominator funds. Note, that in rare cases of heavy misbehavior such as generating of malicious blocks fine may be much higher than recommended one (up to full stake). That way nominator always share the risks and need to pay attention to whom (s)he leases assets regardless of `cover_ability`.
That being said, the purpose of nominator pool smartcontract is to minimize possible ways of Validator misbehavior, 
by checking (where it is possible) messages sent to elector smartcontract and authorizing where and how much TON coins can be sent.
## Functionality
### Validator' functions
This contract allows the Validator to participate in elections on behalf of his and nominator' stake and being 
elected to vote for complaints and network config updates. It also allows the 
Validator to refund stake from previous elections and distribute reward to himself and nominators.
### Nominator' functions
This contract allows nominator to add stake to the pool as well as request withdrawals. 
It also allows nominators to request a refund from the elector smartcontract in case of the Validator's unresponsiveness.

# Build
Building requires installed funC (for more information see [docs](https://test.ton.org/FullNode-HOWTO.txt)). The exact command for the building is presented in [BUILD.md file](https://github.com/EmelyanenkoK/nominator_pool/blob/master/BUILD.md).

# Testing
Currently, we test this contract in private testnets and will be glad for any feedback. You can leave your findings in issues or send PM in [telegram](t.me/rulon).
