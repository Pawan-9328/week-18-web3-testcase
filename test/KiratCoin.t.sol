// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/KiratCoin.sol";

contract TestKiratCoin is Test {
    KiratCoin c; 



    function setUp() public {
         c = new KiratCoin();
    }

function test_DealExample() public {
   address account = 0x1483783755C6d08070B69Dd9e3391c7C00e5F23c;

   //set the balance of 'account' to 'ether '
   vm.deal(account, 10 ether);

   //assert that the balance is set correctly 
   assertEq(address(account).balance,  10 ether);

}

}