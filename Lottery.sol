// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

contract lottery {

    address public manager;// outside this contract this variable can be used
    address [] public players; 
    constructor () {
        manager=msg.sender;// this is called only once where address will be saved as it is deployed
    }
function entery() public payable {// payable is the function type which informs about the transfer of ether
        require(msg.value> 1000 wei);// by writing the amount with unit of ether can be compared
        players.push(msg.sender);// pushing the address of the different players in the arrary 
}
function random() private view returns (uint){
    return uint(keccak256 (block.difficulty, now, players));//?????
}      

function pickwinner() public restricted {//???
    uint index= random()%players.length;
    players[index].transfer(this.balance);
    players= new address[] (0); 
}

modifier restricted() {
    require (msg.sender == manager);
    _;
}
function getplayers() public view returns (address[]) {
    return players;
}

}
