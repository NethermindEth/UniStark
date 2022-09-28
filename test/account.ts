import { ethers } from 'hardhat'
import { ContractFactory, Wallet } from 'ethers';

describe('Token contract', function () {
  it('Deployment should assign the total supply of tokens to the owner', async function () {
    let wallet: Wallet, other: Wallet;
    [wallet, other] = await (ethers as any).getSigners();
    const AccountTest: ContractFactory = await ethers.getContractFactory('AccountTest');
    const accountTest = (await AccountTest.connect(wallet).deploy());
    await accountTest.connect(other).setOwner();
    console.log(await accountTest.owner());
  });
});
