[![Testing status](https://img.shields.io/badge/testing-in%20progress-red.svg)](https://github.com/newton-blockchain) 
[![made-with-funC](https://img.shields.io/badge/Made%20with-funC-a3428f.svg)](https://github.com/newton-blockchain/ton/tree/master/crypto/smartcont)

# Nominator pool
Nomination is an important mechanism of network decentralization (2.6.3 [ton.pdf](ton.org/ton.pdf)) 
which essentially decouple computing/bandwidth capacity from "capital" and thus substantially decrease
the threshold of joining the validation process for all parties.

This repository presents a contract of such nominator pool for the original TON network.
## Trust model
Nominators (actors which lend money) and Validator (actors who validate network) share the risk.
If Validator does his job correctly he gains rewards for himself and nominators of the pool.
Otherwise, upon misbehavior Validator loses part of the steak, that is losing assets of nominators.
That being said, the purpose of nominator pool smartcontract is to minimize possible ways of Validator misbehavior, 
by checking (where it is possible) messages sent to elector smartcontract and authorizing where and how much TON coins can be sent.
## Functionality
### Validator
This contract allows the Validator to participate in elections on behalf of all nominators' stake and being 
elected to vote for complaints and network config updates. It also allows the 
Validator to refund stake from previous elections and distribute reward to himself and nominators.
### Nominator
This contract allows nominators to add their stake to the pool, lock part of their stake from being used for future elections,
and, given that funds are not frozen on elector smartcontract, to withdraw stake with profit.
It also allows nominators to request a refund from the elector smartcontract in case of the Validator's unresponsiveness.
# Build
Building requires installed funC (for more information see [docs](https://test.ton.org/FullNode-HOWTO.txt)). The exact command for the building is presented in [BUILD.md file](https://github.com/EmelyanenkoK/nominator_pool/blob/master/BUILD.md).

# Testing
Currently, we test this contract in private testnets and will be glad for any feedback. You can leave your findings in issues or send PM in [telegram](https://t.me/rulon).
You can also facilitate testing in the original public network by sending tokens to the developers' [address](https://test.toncoin.org/testnet/account?account=EQDGpS6ADl3yOCc1ClWUY-bHDaEVtTLx6fY_RCbLMSjPxWMr).
