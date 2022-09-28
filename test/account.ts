import { ethers, waffle } from 'hardhat'
import fetch from 'node-fetch';
import { ContractFactory, Wallet } from 'ethers';

describe('Token contract', function () {
  it('Deployment should assign the total supply of tokens to the owner', async function () {
    let wallet: Wallet, other: Wallet;
    [wallet, other] = await (ethers as any).getSigners();
    const AccountTest: ContractFactory = await ethers.getContractFactory('AccountTest');
    const accountTest = (await AccountTest.connect(wallet).deploy());
    await accountTest.connect(wallet).setOwner();
    console.log(await accountTest.owner())

    // const tx = await mockTimePoolDeployer.deploy(
    //   '0x071de96cc10e76bef0ae4f25d778e7068b513be616a5f45f3499d5a79db3e81c',
    //   '0x1',
    //   '0x1',
    //   '0x1',
    //   '0x1'
    // )
    // console.log(tx)
  });
});
