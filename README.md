[![Testing status](https://img.shields.io/badge/testing-in%20progress-red.svg)](https://github.com/newton-blockchain) 
[![made-with-funC](https://img.shields.io/badge/Made%20with-funC-a3428f.svg)](https://github.com/newton-blockchain/ton/tree/master/crypto/smartcont)

# Nominator pool
Nomination is important mechanism of network decentralization (2.6.3 [ton.pdf](ton.org/ton.pdf)) 
which essentially decouple computing/bandwidth capacicty from "capital" and thus substantially
decrease threshold of joining the validation process for all parties.

This repository presents contract of such nominator pool for original TON network.
## Trust model
Nominators (actors which lend money) and Validator (actor which validate network) share the risk. 
If Validator does his job correctly he gain rewards for himself and nominators of the pool.
Otherwise, upon misbehavior Validator loose part of steak, that is losing assets of nominators.
That being said, the purpose of nominator pool smartcontract is to minimise possible ways of Validator misbehavior,
by checking (where it is possible) messages sent to elector smartcontract and authorizing where and how much TON coins
can be sent.
## Functionality
### Validator
This contract allows the Validator to participate in elections on behalof of all nominators stake
and being elected to vote for complaints and network config updates.
It also allows the Validator to refund stake from previous elections and distribute reward to himself and nominators.
### Nominator
This contract allows nominators to add their stake to the pool, lock part of their stake from being used for future elections
and, given that funds are not frozen on elector smartcontract, to withdraw stake with profit.
It also allows nominators to request refund from elector smartcontract in case of Validator unresponsiveness.
# Build
Building requires installed funC (for more information see [docs](https://test.ton.org/FullNode-HOWTO.txt)). Exact command for building is presented in [BUILD.md file](https://github.com/EmelyanenkoK/nominator_pool/blob/master/BUILD.md).

# Testing
Currently we test this contract in private testnets and will be glad for any feedback. You can leave your findings in issues or send PM in [telegram](t.me/rulon).
You can also facilitate testing in original public network by sending tokens to developers [address](https://test.ton.org/testnet/account?account=EQDGpS6ADl3yOCc1ClWUY-bHDaEVtTLx6fY_RCbLMSjPxWMr).
