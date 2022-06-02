// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;
contract SolidityTest {

   uint a;
   uint b;

function insertDetails(uint _X, uint _Y) public {
   a=_X;
   b=_Y;
}
   function getResult() public view returns(uint Addition, uint Multiplication, uint Substraction){
      uint A = a + b;
      uint B = a * b;
      uint C = a - b;
      return (A, B, C);
      
   }
}
