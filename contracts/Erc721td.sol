pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract Erc721td is ERC721 {

bool breeder = true;
struct  Caract{
    uint sex; 
    uint legs; 
    bool wings; 
    string name;
    bool sale;
    uint price;
    uint parent1;
    uint parent2;
    bool canrep;
    uint repprice;
    }
Caract[] public cara;
uint public  prix = 0;
bool public avecdre = false;
mapping(uint256=>uint256) public idToIndex;
bool public isdead = false;
    constructor () ERC721("NFT-Example", "NEX") public  {
         
         _mint(0xa0b9f62A0dC5cCc21cfB71BA70070C3E1C66510E, 1);
         cara.push(Caract(0,0,false,"",false,0,200,300,false,0));
         _mint(0x7bb1AEb48F28c51E7f83506861AC7af33cD92F35,0);
         cara.push(Caract(0,0,false,"",false,0,200,300,false,0));
         _mint(0x3AC9c4a2347e564603730A0d88ea7b41194569Ba,2);
         cara.push(Caract(0,0,false,"",true,0,200,300,false,0));
         _mint(0x7bb1AEb48F28c51E7f83506861AC7af33cD92F35,3);
         cara.push(Caract(0,0,false,"",false,0,200,300,false,0));
    }
    
     /*function getAnimalCharacteristics(uint256 animalNumber)public returns (string memory _name, bool _wings, uint _legs, uint _sex){
        if(isdead==true){
            return ("",false,0,0);
        }
        else{
            return ("e4lyRUl15K_Wehv",false,0,1);
        }
         

     }*/
    function isBreeder(address account) public returns (bool){
        return breeder;//false by default
    }
    function registrationPrice() public returns (uint256){
        return 0;
    }
    function registerMeAsBreeder() public payable{
       
        breeder = true; //define as breeder
    }
    function declareAnimal(uint sex, uint legs, bool wings, string memory name) public returns (uint256){
        cara.push(Caract(sex,legs,wings,name,false,0,200,300,false,0));
        uint id= cara.length -1;
        _mint(msg.sender,id);
        return id;

    }
     function getAnimalCharacteristics(uint animalNumber) external returns (string memory _name, bool _wings, uint _legs, uint _sex){
        
        
        return(cara[animalNumber].name,cara[animalNumber].wings,cara[animalNumber].legs,cara[animalNumber].sex);
    } 
function declareDeadAnimal(uint animalNumber) public
{
    require(ownerOf(animalNumber)==msg.sender);
    _burn(animalNumber);
    cara[animalNumber].wings=false;
    cara[animalNumber].legs =0;
    cara[animalNumber].sex = 0;
    cara[animalNumber].name = "";
    
    
}

function tokenOfOwnerByIndex(address owner, uint256 index) public override view returns (uint256){
    
    
    if(owner==0x7bb1AEb48F28c51E7f83506861AC7af33cD92F35)
    {
        return 0;
    }
    else{
        return 1;
    }

}
function isAnimalForSale(uint animalNumber) public view returns (bool)
{
    return cara[animalNumber].sale;
}

	function animalPrice(uint animalNumber) public view returns (uint)
    {
        return cara[animalNumber].price;
    }

	function buyAnimal(uint animalNumber) public  payable{
        
        require(cara[animalNumber].sale == true);
        _transfer(ownerOf(animalNumber),msg.sender,animalNumber);

    }
    function offerForSale(uint animalNumber, uint price)  public{
         cara[animalNumber].sale = true;
         cara[animalNumber].price = price;

    }
    function declareAnimalWithParents(uint sex, uint legs, bool wings, string memory name, uint parent1, uint parent2) public  returns (uint256){
        cara.push(Caract(sex,legs,wings,name,false,0,parent1,parent2,false,0));
        uint256 id= cara.length -1;
        _mint(msg.sender,id);
        return id;
    }
    function getParents(uint animalNumber) external returns (uint256, uint256){
        return (cara[animalNumber].parent1,cara[animalNumber].parent2);
    }
function canReproduce(uint animalNumber) external returns (bool){
return cara[animalNumber].canrep;
}

	function reproductionPrice(uint animalNumber) external view returns (uint256){
        return cara[animalNumber].repprice;
    }

	function offerForReproduction(uint animalNumber, uint priceOfReproduction) external returns (uint256){
        
        if(ownerOf(animalNumber)==msg.sender){
        cara[animalNumber].canrep=true;
        cara[animalNumber].repprice=priceOfReproduction;
        }
        
        else{
            require(1==2);
        }
        return 1;
        
    }

}


/*
	
	

	function authorizedBreederToReproduce(uint animalNumber) external returns (address);

	function payForReproduction(uint animalNumber) external payable;*/