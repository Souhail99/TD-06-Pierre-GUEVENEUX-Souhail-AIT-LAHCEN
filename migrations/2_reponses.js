
const Str = require('@supercharge/strings')
var evaluator = artifacts.require("Evaluator.sol");
var evaluator2 = artifacts.require("Evaluator2.sol");
var nft = artifacts.require("Erc721td.sol");


module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        
         
        await deploynft(deployer, network, accounts);
        await deployEvaluator(deployer, network, accounts);
        await reponses(deployer, network, accounts);
    });
};
async function deploynft(deployer, network, accounts) {
	Nft = await nft.new();
}
async function deployEvaluator(deployer, network, accounts) {
	Evaluator = await evaluator.new(Nft.address)
	// Evaluator = await evaluator.at("0x6B19d275dA33857a3f35F7c1034048Ba1abF75CD") 
	Evaluator2 = await evaluator2.new(Nft.address)
}
async function reponses (deployer, network, accounts) {
console.log(Nft.address)
//prix1 = await Nft.animalPrice(3);
//prix2 = await Nft.animalPrice(3);
//console.log(prix1,prix2);
//await NFT.mintNft("0xa0b9f62A0dC5cCc21cfB71BA70070C3E1C66510E");
 //console.log("submit:")
//await Evaluator.submitExercice(Nft.address,{from:accounts[0]});  

/*await Evaluator.ex1_testERC721({from:accounts[0]});
await Evaluator.ex2a_getAnimalToCreateAttributes({from:accounts[0]});

await Evaluator.ex2b_getAnimalToCreateAttributes(nbr,{from:accounts[0]});
 */
//await Evaluator.ex4_testDeclareAnimal({from:accounts[0]});
//sol = await Evaluator.studentExerciceSolution[msg.sender].isBreeder(address(Evaluator.address),{from:accounts[0]});
//console.log(sol);
//await Nft.declareAnimal(1, 0, false,"e4lyRUl15K_Wehv");

}

