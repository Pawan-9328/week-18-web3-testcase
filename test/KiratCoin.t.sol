// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/KiratCoin.sol";

contract TestKiratCoin is Test {
    KiratCoin c; 

event Transfer(address indexed from, address indexed to, uint256 value);


    function setUp() public {
         c = new KiratCoin();
    }

function testTransferEmit() public {
    c.mint(address(this), 100);
    vm.expectEmit(true, true, false, false);

    emit Transfer(address(this),0x1483783755C6d08070B69Dd9e3391c7C00e5F23c, 100);

    c.transfer(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c, 10);

}

}