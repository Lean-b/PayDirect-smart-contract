// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;



/// @title Pay Direct.
/// @author Leandro.
/// @notice It pays directly to the seller's wallet address.

contract PayDirect {
    address private vendedor;

    constructor() {
        vendedor = msg.sender;
    }

    mapping(address => uint256) private balances;

    event Transfer(uint256 amount, address indexed vendedor);
    event Deposit(uint256 amount, address indexed comprador, address indexed vendedor);

    function setVendedor(address _vendedor) public {
        vendedor = _vendedor;
    }

    function deposit() public payable{
        require(msg.value > 0, "Debe enviar una cantidad positiva de ether.");
        emit Deposit(msg.value, msg.sender, vendedor);
        transferToVendedor(msg.value);
    }

    function transferToVendedor(uint256 _amount) internal {
        require(_amount > 0, "Debe enviar una cantidad positiva de ether.");
        payable(vendedor).transfer(_amount);
        emit Transfer(_amount, vendedor);
    }

}
