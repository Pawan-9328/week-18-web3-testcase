// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/KiratCoin.sol";

contract TestKiratCoin is Test {
    KiratCoin c; 

    function setUp() public {
         c = new KiratCoin();
    }

  function testMint() public  {
    c.mint(address(this), 100);
    assertEq(c.balanceOf(address(this)), 100, "ok");

    // before mint → should be 0
    assertEq(c.balanceOf(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c), 0, "ok");

    // now mint
    c.mint(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c, 100);

    // after mint → should be 100
    assertEq(c.balanceOf(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c), 100, "ok");
}

function testTransfer() public{
     c.mint(address(this), 100);
     c.transfer(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c, 50);


     assertEq(c.balanceOf(address(this)),50);
     assertEq(c.balanceOf(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c), 50);

     // back the money to the original guy 
     vm.prank(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c);
     c.transfer(address(this), 50);

     assertEq(c.balanceOf(address(this)), 100);
     assertEq(c.balanceOf(0x1483783755C6d08070B69Dd9e3391c7C00e5F23c), 0);

}
    
    
}
