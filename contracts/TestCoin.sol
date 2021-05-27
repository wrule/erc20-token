// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

// 符合ERC20标准的代币合约
contract TestCoin {
  // 代币名称
  function name()
  public pure returns (string memory) {
    return "My Test Coin";
  }

  // 代币符号
  function symbol()
  public pure returns (string memory) {
    return "TEST";
  }

  // 代币精度
  function decimals()
  public pure returns (uint8) {
    return 8;
  }

  // 代币总供应量
  function totalSupply()
  public pure returns (uint256) {
    return 1000 * 1000 * 1000 * 100;
  }

  // 查询某地址下代币余额
  function balanceOf(address addr)
  public pure returns (uint256) {
    return 10000;
  }

  // 发送代币到某地址
  function transfer(address to, uint256 value)
  public pure returns (bool) {
    return true;
  }

  // 两地址之间的代币转移
  function transferFrom(address to, address from, uint256 value)
  public pure returns (bool) {
    return true;
  }

  function approve(address spender, uint256 value)
  public pure returns (bool) {
    return true;
  }

  function allowance(address owner, address spender)
  public pure returns (uint256) {
    return 0;
  }

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
