import { ethers } from "hardhat";
import { Starter } from "./../typechain-types/Starter";

export enum revertMessages {
  INVALID_PROOF = "Proof is not valid",
}

export const deployStarter = async (): Promise<Starter> => {
  const _contract: any = await (await ethers.getContractFactory("Starter")).deploy();
  return _contract;
};
