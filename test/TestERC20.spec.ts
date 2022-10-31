import { expect } from './shared/expect'
import { TestERC20 } from '../typechain/TestERC20'
import { ethers, waffle } from 'hardhat'


describe('Testing Transfer', () => {
  let erc20: TestERC20
  
  const fixture = async () => {
    const erc20Factory = await ethers.getContractFactory('TestERC20')
    return (await erc20Factory.deploy(0)) as TestERC20
  }

  before('deploying ERC20', async () => {
    erc20 = await waffle.loadFixture(fixture)
  })

  it('transfer', async () => { 
    const accounts = await ethers.getSigners();
    const bob = accounts[1];
    const alice = accounts[2];
    
    await erc20.mint(bob.address, 10101);
    expect(await erc20.balanceOf(bob.address)).to.equal(10101);
    expect(await erc20.balanceOf(alice.address)).to.equal(0);
    

    await erc20.connect(bob).transfer(alice.address, 10101);
    expect(await erc20.balanceOf(bob.address)).to.equal(0);
    expect(await erc20.balanceOf(alice.address)).to.equal(10101);
    })

 
})
