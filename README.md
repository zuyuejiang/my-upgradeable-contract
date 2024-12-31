# Upgradeable Vending Machine Smart Contract
[Alchemy tutorial link](https://university.alchemy.com/course/ethereum/md/63bfe506016d9c00049221fc)
My work: [📃 Proxy Contract](https://sepolia.etherscan.io/address/0x91199D2216721918BC60FB9094557f20Be5f0960) | [🍦V1](https://sepolia.etherscan.io/address/0x5D45F48670956b56Ad75F2120109325f6E9e01eD#code) [🍦V2](https://sepolia.etherscan.io/address/0x0BBC4E44777e61E267638a5D748965c66fB07Cdd#code) [🍦V3](https://sepolia.etherscan.io/address/0x6d91ead796aadb597d3ae48ab9e24bbb0e871880#code
)

### setup instruction
- `npm install`
- `touch .env` and include your 
    - `ALCHEMY_SEPOLIA_URL`: get it from Alchemy Dashboard
    - `SEPOLIA_PRIVATE_KEY`: your private key
    - `ETHERSCAN_KEY`: get it here from Etherscan 
- `npx hardhat run scripts/deployProxy.js --network sepolia`
- record your 'Proxy contract address' and 'Implementation contract address'
- `npx hardhat verify --network sepolia (Implementation contract address)`
- copy your 'Proxy contract address' to https://sepolia.etherscan.io/, select 'Contract' -> 'More Options' -> 'Is this a proxy?' -> verify and save
- open `upgradeProxy.js` and edit `ethers.getContractFactory('VendingMachineVn');` where `n` is the version from 2
- `npx hardhat run scripts/upgradeProxy.js --network sepolia`
- record the new 'Implementation contract address'
- `npx hardhat verify --network sepolia (Implementation contract address)`
- check on etherscan again
- ......

