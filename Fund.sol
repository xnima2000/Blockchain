// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract fund_Project {
    //mapping to store which address depositeded how much ETH
    mapping (address => uint256) public Address_to_Amount_Funded;

    //kovan-network in https://docs.chain.link/docs/ethereum-addresses/
    AggregatorV3Interface version = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

    // array of addresses who deposited
    address[] public funders;
    
    //address of the owner (who deployed the contract)
    address public owner;
    
    // giving map a value of amount & checking minimum value that has spend in contrct
    constructor(){
        owner = msg.sender;
    }

    // setting a minimum fo TXs and also push data to Founders map
    function fund() public payable {
        uint256 minimumValueUSD = 1 * 10 **18; // means 50 USD is minimum tx
        require(GetConversionRate(msg.value) >= minimumValueUSD, "Hey! you have to spend more ETH! minimum is 50 000000000000000000 wei");
        Address_to_Amount_Funded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
    
    // getting version of aggregator
    function getVersion() public view returns(uint256){  
        return version.version();   
    }

    // geting price into wei standard
    function getPrice() public view returns(uint256){
       (,int256 answer,,,) = version.latestRoundData();
       return uint256(answer*10000000000); // to wei
       //1,676.928995250000000000 ETH/USD with 18 decimals 
    }
    
    // getting convert by eth in wei standard
    function GetConversionRate(uint256 ethAmount)public view returns(uint256){
        uint256 ethPrice = getPrice();
        ethAmount = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmount;
    }

    //modifier: https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb
    modifier onlyOwner {
    	//is the message sender owner of the contract?
        require(msg.sender == owner,"Bro, you are not the owner!");   
        _;
        // onlyOwner modifer will first check the condition inside it and if true, withdraw function will be executed!
    }
    
    //This function is for handeling the amount that comes to this contract
    function withdraw() payable onlyOwner public  {
        payable(msg.sender).transfer(address(this).balance); // this is the way that you can use and transfer money in solidity 0.8 or above
        // msg.sender.transfer(address(this).balance); // you have problem with this in solidity 0.8 to down
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            Address_to_Amount_Funded[funder] = 0;
        }
        //funders array will be initialized to 0
        funders = new address[](0);
    }
}

