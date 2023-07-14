// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PayDirect {
    // Dirección del vendedor
    address private vendedor;

    // Constructor del contrato que establece al creador como vendedor
    constructor() {
        vendedor = msg.sender;
    }

    // Mapping para almacenar los saldos de los compradores
    mapping(address => uint256) private balances;

    // Evento emitido al realizar una transferencia al vendedor
    event Transfer(uint256 amount, address indexed vendedor);

    // Evento emitido al realizar un depósito en el contrato
    event Deposit(uint256 amount, address indexed comprador, address indexed vendedor);

    // Función para establecer la dirección del vendedor
    function setVendedor(address _vendedor) public {
        vendedor = _vendedor;
    }

    // Función para realizar un depósito en el contrato
    function deposit() public payable {
        require(msg.value > 0, "Debe enviar una cantidad positiva de ether.");
        emit Deposit(msg.value, msg.sender, vendedor);
        transferToVendedor(msg.value);
    }

    // Función interna para transferir el saldo al vendedor
    function transferToVendedor(uint256 _amount) internal {
        require(_amount > 0, "Debe enviar una cantidad positiva de ether.");
        payable(vendedor).transfer(_amount);
        emit Transfer(_amount, vendedor);
    }
}
