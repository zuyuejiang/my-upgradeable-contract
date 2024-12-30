const { ethers, upgrades } = require('hardhat');

// TO DO: Place the address of your proxy here!
const proxyAddress = '0x91199D2216721918BC60FB9094557f20Be5f0960';

async function main() {
//   const VendingMachineV2 = await ethers.getContractFactory('VendingMachineV2');
//   const upgraded = await upgrades.upgradeProxy(proxyAddress, VendingMachineV2);
  const VendingMachineV3 = await ethers.getContractFactory('VendingMachineV3');
  const upgraded = await upgrades.upgradeProxy(proxyAddress, VendingMachineV3);

  const implementationAddress = await upgrades.erc1967.getImplementationAddress(
    proxyAddress
  );

  const owner = await upgraded.owner();
  console.log("The current contract owner is: " + owner);
  console.log('Implementation contract address: ' + implementationAddress);
}

main();