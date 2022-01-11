// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract erc20{
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    string  name;
    string  symbol;
    uint8   decimal;

    mapping(address => uint256) balances;

    mapping(address => mapping(address => uint256)) allowed;

    uint256 totalSupply_ =1000;
    constructor(string memory _name, string memory _symbol, uint8 _decimal){
        balances[msg.sender] = totalSupply_;
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
    }
    function name1() public view returns (string memory) {
        return name;
    }
    function symbol1() public view returns (string memory) {
        return symbol;
    }
    function decimal1() public view returns (uint8) {
        return decimal;
    }
    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }
    function balanceOf(address tokenOwner) public view returns(uint){
        return balances[tokenOwner];
    }

    function transefer(address receiver, uint numTokens) public returns (bool){
        require(numTokens <= balances[msg.sender]);
         balances[msg.sender]-=numTokens;
         balances[receiver]+=numTokens;
         emit Transfer(msg.sender, receiver, numTokens);
         return true;
    }

    function approve(address delegate, uint numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

}