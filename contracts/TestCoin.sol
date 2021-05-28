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
    return 1e11;
  }

  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) public allowed;

  // 查询某地址下代币余额
  function balanceOf(address addr)
  public view returns (uint256) {
    return balances[addr];
  }

  // 发送代币到某地址
  function transfer(address to, uint256 value)
  public returns (bool) {
    require(
      balances[msg.sender] >= value,
      "balance is not enough"
    );
    balances[msg.sender] -= value;
    balances[to] += value;
    emit Transfer(msg.sender, to, value);
    return true;
  }

  // 批准额度转账
  function transferFrom(address to, address from, uint256 value)
  public returns (bool) {
    uint256 myAllowance = allowed[from][msg.sender];
    require(
      balances[from] >= value && myAllowance >= value,
      "allowance is not enough"
    );
    balances[from] -= value;
    // 可能会出现溢出错误？
    allowed[from][msg.sender] -= value;
    balances[to] += value;
    emit Transfer(from, to, value);
    return true;
  }

  // 给某地址批准额度
  function approve(address spender, uint256 value)
  public returns (bool) {
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }

  // 查询批准额度
  function allowance(address owner, address spender)
  public view returns (uint256) {
    return allowed[owner][spender];
  }

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
