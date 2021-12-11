import { Starter } from "./../typechain-types";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { ethers as Ethers } from "ethers";
import { ethers } from "hardhat";
import { revertMessages, deployStarter } from "./helper";

describe("", () => {
  let starter: Starter;
  let addr1: SignerWithAddress;
  let addr2: SignerWithAddress;
  let addr3: SignerWithAddress;

  before(async () => {
    [addr1, addr2, addr3] = await ethers.getSigners();
    starter = await deployStarter();
  });

  it("FIRST_ACTION", async () => {
    // await nftContract.mint(...initMintProofsArgs);
    // await expect(nftContract.mint(...initMintWrongProofArgs)).to.be.revertedWith(revertMessages.INVALID_PROOF);
    // expect(await nftContract.balanceOf(addr1.address)).to.be.equal(1); // mint NFT
    // const character = await nftContract.characters(0);
    // expect(character.cHash).equal(initMintProofsArgs[3][0]);
    // expect(character.isRevealed).equal(false);
  });
});
