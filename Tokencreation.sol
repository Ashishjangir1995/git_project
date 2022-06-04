// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
interface IERC20 { // all functions and actions defined to inheritate further in the program
    function totalsupply() external view returns (uint256); // inital minned tokens 
    function balanceof() external view  returns (uint256); // to show the total balance of the account after intial supply of tokens
    function transfer(address recipient, uint256 amount) external returns (bool);// tranfer of tokens to receiver
    event Transfer(address indexed from, address indexed to, uint256 value); // main work to transfer the amount from sender to receiver
contract AKToken is IERC20{ //contract is created under ERC20
    string public constant name = "AKToken";// variables are defined according to requirements
    string public constant symbol = "AKT";
    uint8 public constant decimal= 2;// upto 2 demical tokens can be shared

event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);// approval is required from the receiver and sender
event Transfer(address indexed from, address indexed to, uint tokens);
 
        mapping(address=>uint256) balances;// mapping of balance on address of both
        mapping(address=> mapping(address=>uint)) allowed;// nested mapping is done ...?
        uint256 totalsupply= 10000 wei;// inital total supply

constructor() {
balances[msg.sender]= totalsupply;// totalsupply is assigned to the tokenowner
}
function totalsupply() public override view returns (uint256){
    return totalsupply;
}
function balanceof(address tokenowner) public override view returns   (uint256){
    return balances[tokenowner];
}
function transfer(address receiver, uint256 numtokens) public override returns (bool){
    require(numtokens<= balances[msg.sender]);//require will first check the condition 
    balances[msg.sender]-= numtokens;
    balances[receiver]+= numtokens;
    emit Transfer(msg.sender, receiver, numtokens);
    return true;
}

}
