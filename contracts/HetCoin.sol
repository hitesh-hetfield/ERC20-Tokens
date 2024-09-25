// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ERC20Interface { 

    function totalSupply() external view returns(uint256 _totalSupply);
    function balanceOf(address _user) external view returns(uint _remainingBalance);
    function transfer(address _recipient, uint _value) external returns(bool success); 
    function transferFrom(address _owner, address _recipient, uint _amount) external returns(bool success); 
    function approve(address _spender, uint _value) external returns(bool success);
    function allowance(address _owner, address _spender) external returns(uint256 _approvedToken);

    event Transfer(address indexed _from, address indexed _to, uint256 _amount);
    event Approval(address _owner, address _spender, uint256 _value);
}

contract HetCoin is ERC20Interface {

    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public _totalSupply;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    constructor(
        string memory _name, 
        string memory _symbol, 
        uint8 _decimals, 
        uint256 totalSupply_
        ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        _totalSupply = totalSupply_ * 10 ** decimals; 

        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() external view returns (uint256 totalSupply_) {
        return _totalSupply;
    }

    function balanceOf(address _user) external view returns(uint256 balance) {
        return balances[_user];
    }

    function allowance(address _owner, address _spender) external view returns(uint _approvedAllowance) {
        return allowances[_owner][_spender];
    }

    function transfer(address _recipient, uint _value) external returns(bool success) {
        require(_recipient != address(0), "Cannot transfer to address(0)");
        require(balances[msg.sender] >= _value, "Insufficient balance");

        balances[msg.sender] -= _value;
        balances[_recipient] += _value;

        emit Transfer(msg.sender, _recipient, _value);
        return true;
    }

    function approve(address _spender, uint _value) external returns(bool success) {
        allowances[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _owner, address _recipient, uint _amount) external returns(bool success) {
        require(_recipient != address(0), "Cannot transfer to address(0)");
        require(balances[_owner] >= _amount, "Insufficient funds in owner's account" );
        require(allowances[_owner][msg.sender] >= _amount, "Insufficient allowance");

        balances[_owner] -= _amount;
        balances[_recipient] += _amount;

        allowances[_owner][msg.sender] -= _amount;
        emit Transfer(_owner, _recipient, _amount);
        return true;
    }
}