# FSFR Deployment Instructions

This document explains how to deploy the **FSFR — Fruit Sniffers Token** contract.

## 1. Requirements

- Node.js 18+
- `npm` or `pnpm`
- Hardhat (recommended) or Foundry
- Wallet (MetaMask, Rabby, etc.) funded with enough ETH for gas
- Target network: for example **Base**, **Ethereum**, or any EVM‑compatible chain

## 2. Install dependencies

```bash
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
npm install @openzeppelin/contracts
npx hardhat init
```

Make sure `FSFR.sol` is in `contracts/FSFR.sol`.

## 3. Example Hardhat deploy script

Create `scripts/deploy-fsfr.js`:

```js
const hre = require("hardhat");

async function main() {
  const FSFR = await hre.ethers.getContractFactory("FSFR");
  const token = await FSFR.deploy();
  await token.waitForDeployment();

  console.log("FSFR deployed at:", token.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
```

## 4. Network config (example: Base)

In `hardhat.config.js` add a network section like:

```js
networks: {
  base: {
    url: "https://mainnet.base.org",
    accounts: [process.env.DEPLOYER_PRIVATE_KEY],
  },
},
```

Never commit your private key. Use `.env` and `dotenv`.

## 5. Deploy

```bash
npx hardhat run scripts/deploy-fsfr.js --network base
```

The script will print the contract address, for example:

```text
FSFR deployed at: 0x....
```

## 6. (Optional) Verify on a block explorer

If the explorer supports Hardhat verification:

```bash
npx hardhat verify --network base 0xYourContractAddressHere
```

You now have a **fixed‑supply, ownerless FSFR token** deployed on your chosen chain.
