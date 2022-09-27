import { ethers, waffle } from 'hardhat'
import fetch from 'node-fetch';
import { BigNumber, BigNumberish, constants, ContractFactory, Wallet } from 'ethers';
import { MockTimeUniswapV3PoolDeployer } from '../typechain/MockTimeUniswapV3PoolDeployer';

export type StarknetDevnetGetAccountsResponse = {
  address: string;
  initial_balance: number;
  private_key: string;
  public_key: string;
};

async function getStarkNetDevNetAccounts(): Promise<Array<StarknetDevnetGetAccountsResponse>> {
  const devnet_feeder_gateway_url: string =
    process.env.STARKNET_PROVIDER_BASE_URL != undefined
      ? process.env.STARKNET_PROVIDER_BASE_URL
      : 'http://127.0.0.1:5050';
  const response = await fetch(`${devnet_feeder_gateway_url}/predeployed_accounts`, { method: 'GET' });
  return response.json();
}

describe('Token contract', function () {
  it('Deployment should assign the total supply of tokens to the owner', async function () {
    let wallet: Wallet, other: Wallet;
    [wallet, other] = await (ethers as any).getSigners()
    const MockTimeUniswapV3PoolDeployerFactory: ContractFactory = await ethers.getContractFactory('MockTimeUniswapV3PoolDeployer')
    const mockTimePoolDeployer = (await MockTimeUniswapV3PoolDeployerFactory.connect(wallet).deploy())
    console.log(mockTimePoolDeployer.address)
    // console.log(await mockTimePoolDeployer.owner());

    // const tx = await mockTimePoolDeployer.connect(wallet).deploy(
    //   '0x071de96cc10e76bef0ae4f25d778e7068b513be616a5f45f3499d5a79db3e81c',
    //   '0x1',
    //   '0x1',
    //   '0x1',
    //   '0x1'
    // )
    // console.log(tx)
  });
});
