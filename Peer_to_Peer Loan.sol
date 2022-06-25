// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3; //pragma is here to specify the version of compiler we are using

contract loan{

struct lender{
    uint balance;
    string name;
    uint interest;
    address Bddress;
}

mapping (address=>lender) lenders;

struct borrower{

    address Address;
    string name;
    uint balance;
}

mapping (address=> borrower) borrowers;

function getDetailsofLender(uint _balance, string memory _name, uint _interest, address _Bddress) public{
        lenders[_Bddress].name = _name;
        lenders[_Bddress].balance= _balance;
        lenders[_Bddress].interest= _interest;
        lenders[_Bddress].Bddress=_Bddress;

        require(lenders[_Bddress].Bddress!= msg.sender, "deployer cant be the lender"); 
        
}
uint interestAmount;
uint timePeriod;
uint repay;
function getDetailsofBorrower(string memory _name, address _Address, uint _balance) public{
           
            borrowers[_Address].name=_name;
            borrowers[_Address].balance= _balance;
            borrowers[_Address].Address= _Address;
            
}

function loanAmount(uint _amount, uint _timePeriod, address _Bddress, address _Address) public {
            interestAmount= (_amount*_timePeriod*lenders[_Bddress].interest)/100;
            repay= interestAmount+ borrowers[_Address].balance;
}

function LoanPayment() public view returns (uint){
return repay;
}


}
