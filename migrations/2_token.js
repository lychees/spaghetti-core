// ============ Contracts ============

// Token
// deployed first
const Y3dFactory = artifacts.require("y3dFactory");

const migration = async (deployer, network, accounts) => {
  await Promise.all([
    deployToken(deployer, network, accounts),
  ]);
};

module.exports = migration;

// ============ Deploy Functions ============
async function deployToken(deployer, network, accounts) {
  await deployer.deploy(Y3dFactory);
  //let y3dFactory = new web3.eth.Contract(Y3dFactory.abi, Y3dFactory.address);  
  //y3dFactory.methods.initWETH().send({from: accounts[0], gas: 67000000});
  //y3dFactory.methods.initUNI().send({from: accounts[0], gas: 100000});
};