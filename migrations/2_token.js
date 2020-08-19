// ============ Contracts ============

// Token
// deployed first
const y3d = artifacts.require("y3dToken");

const migration = async (deployer, network, accounts) => {
  await Promise.all([
    deployToken(deployer, network),
  ]);
};

module.exports = migration;

// ============ Deploy Functions ============

async function deployToken(deployer, network) {
  await deployer.deploy(y3dToken);
}
