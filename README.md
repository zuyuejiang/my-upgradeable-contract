# Upgradeable Vending Machine Smart Contract
alchemy tutorial: https://university.alchemy.com/course/ethereum/md/63bfe506016d9c00049221fc
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

