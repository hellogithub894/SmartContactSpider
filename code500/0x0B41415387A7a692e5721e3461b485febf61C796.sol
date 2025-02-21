//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

interface IERC20 {
    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract Presale {
    using SafeMath for uint256;

    IERC20 public BTC20X;
    IERC20 public USDT;

    AggregatorV3Interface public priceFeedETH;

    uint256 public totalBuyer;

    address payable public owner;

    uint256 public referrerPercentage;
    uint256 public airDropRefPercentage;
    uint256 public percentageDivider;
    uint256 public tokenPerUsd;
    uint256 public airDropAmount;
    uint256 public minAmount;
    uint256 public maxAmount;
    uint256 public presaleTime;
    uint256 public soldToken;
    uint256 public tokenHardCap;
    uint256 public UsdtHardCap;
    uint256 public amountRaised;

    struct UserInfo {
        uint256 claimAbleAmount;
        address referrer;
        uint256 referrerReward;
        bool claimedAirdrop;
        bool isExists;
    }

    mapping(address => UserInfo) users;

    modifier onlyOwner() {
        require(msg.sender == owner, "Presale: Not an owner");
        _;
    }

    event BuyToken(address _user, uint256 _amount);

    constructor(address BTC20X_, address USDT_, address priceFeed_) {
        owner = payable(msg.sender);
        BTC20X = IERC20(BTC20X_);
        USDT = IERC20(USDT_);
        priceFeedETH = AggregatorV3Interface(priceFeed_);
        referrerPercentage = 10_00;
        airDropRefPercentage = 0;
        percentageDivider = 100_00;
        airDropAmount = 0;
        tokenPerUsd = 1;
        UsdtHardCap = type(uint256).max;
        tokenHardCap = type(uint256).max;
        minAmount = 0;
        maxAmount = type(uint256).max;
        presaleTime = type(uint256).max;
    }

    function buyToken(uint256 _amount, address _referrer) public {
        UserInfo storage user = users[msg.sender];
        setReferrer(msg.sender, _referrer, _amount, true);
        uint256 numberOfTokens = usdtToToken(_amount);

        require(
            numberOfTokens >= minAmount && numberOfTokens <= maxAmount,
            "Presale: Amount not correct"
        );
        require(
            numberOfTokens + soldToken <= tokenHardCap &&
                _amount + amountRaised <= UsdtHardCap,
            "Exceeding HardCap"
        );
        require(block.timestamp < presaleTime, "Presale: Presale over");
        if (!user.isExists) {
            user.isExists = true;
            totalBuyer++;
        }
        USDT.transferFrom(msg.sender, address(this), _amount);
        amountRaised += _amount;
        user.claimAbleAmount += numberOfTokens;
        soldToken = soldToken.add(numberOfTokens);
        emit BuyToken(msg.sender, usdtToToken(_amount));
    }

    // to buy BTC20X during presale time
    function buyWithETH(address _referrer) public payable {
        UserInfo storage user = users[msg.sender];
        setReferrer(msg.sender, _referrer, msg.value, false);
        uint256 numberOfTokens = ethToToken(msg.value);

        require(
            numberOfTokens >= minAmount && numberOfTokens <= maxAmount,
            "Presale: Amount not correct"
        );
        require(
            numberOfTokens + soldToken <= tokenHardCap &&
                ethToUsdt(msg.value) + amountRaised <= UsdtHardCap,
            "Exceeding HardCap"
        );
        require(block.timestamp < presaleTime, "Presale: Presale over");
        if (!user.isExists) {
            user.isExists = true;
            totalBuyer++;
        }
        amountRaised += ethToUsdt(msg.value);
        user.claimAbleAmount += numberOfTokens;
        soldToken = soldToken.add(numberOfTokens);
        emit BuyToken(msg.sender, ethToToken(msg.value));
    }

    // to check number of BTC20X for given ETH
    function ethToToken(uint256 _amount) public view returns (uint256) {
        uint256 numberOfTokens = _amount
            .mul(getLatestPriceETH())
            .mul(tokenPerUsd)
            .div(1e8);
        return numberOfTokens;
    }

    // to get real time price of ETH
    function getLatestPriceETH() public view returns (uint256) {
        (, int256 price, , , ) = priceFeedETH.latestRoundData();
        return uint256(price);
    }

    function ethToUsdt(uint256 _value) public view returns (uint256) {
        uint256 numberOfUSDT = _value.mul(getLatestPriceETH()).div(1e8);
        return numberOfUSDT;
    }

    function claim() public {
        UserInfo storage user = users[msg.sender];
        require(user.isExists, "Didn't bought");
        require(block.timestamp >= presaleTime, "Wait for the Presale endtime");
        require(
            user.referrerReward > 0 || user.claimAbleAmount > 0,
            "Amount Already claimed"
        );
        if (user.referrerReward > 0) {
            BTC20X.transferFrom(owner, msg.sender, user.referrerReward);
        }
        if (user.claimAbleAmount > 0) {
            BTC20X.transferFrom(owner, msg.sender, user.claimAbleAmount);
        }
        user.claimAbleAmount = 0;
        user.referrerReward = 0;
    }

    function setReferrer(
        address _user,
        address _referrer,
        uint256 _amount,
        bool _val
    ) internal {
        UserInfo storage user = users[_user];
        if (user.referrer == address(0)) {
            if (
                _referrer != _user &&
                users[_referrer].isExists &&
                msg.sender != users[_referrer].referrer
            ) {
                user.referrer = _referrer;
            } else {
                user.referrer = address(0);
            }
        }
        if (user.referrer != address(0)) {
            if (_val) {
                users[user.referrer].referrerReward += usdtToToken(
                    (_amount * referrerPercentage) / percentageDivider
                );
            } else {
                users[user.referrer].referrerReward +=
                    (ethToToken(_amount) * referrerPercentage) /
                    percentageDivider;
            }
        }
    }

    function usdtToToken(uint256 _amount) public view returns (uint256) {
        uint256 numberOfTokens = _amount.mul(tokenPerUsd).div(
            10 ** USDT.decimals()
        );
        return numberOfTokens.mul(10 ** BTC20X.decimals());
    }

    function airDrop() external {
        UserInfo storage user = users[msg.sender];
        require(user.isExists, "No Existence Found!");
        require(!user.claimedAirdrop, "Already claimed");
        IERC20(BTC20X).transferFrom(owner, msg.sender, airDropAmount);
        if (user.referrer != address(0)) {
            IERC20(BTC20X).transferFrom(
                owner,
                user.referrer,
                (airDropAmount * airDropRefPercentage) / percentageDivider
            );
        }
        user.claimedAirdrop = true;
    }

    // to change Price of the BTC20X
    function changePrice(uint256 _tokenPerUsd) external onlyOwner {
        tokenPerUsd = _tokenPerUsd;
    }

    function changeAirDropAmount(uint256 _amount) external onlyOwner {
        airDropAmount = _amount * (10 ** BTC20X.decimals());
    }

    function setPresaleAmount(
        uint256 _minAmount,
        uint256 _maxAmount
    ) external onlyOwner {
        minAmount = _minAmount;
        maxAmount = _maxAmount;
    }

    function setPresaleTime(uint256 _time) external onlyOwner {
        presaleTime = _time;
    }

    // transfer ownership
    function changeOwner(address payable _newOwner) external onlyOwner {
        owner = _newOwner;
    }

    // to draw funds for liquidity
    function transferFunds(uint256 _value) external onlyOwner returns (bool) {
        owner.transfer(_value);
        return true;
    }

    function transferUSDTFunds(
        uint256 _value
    ) external onlyOwner returns (bool) {
        USDT.transfer(owner, _value);
        return true;
    }

    function transferStuckFunds(
        uint256 _value
    ) external onlyOwner returns (bool) {
        BTC20X.transfer(owner, _value);
        return true;
    }

    function changeAddresses(
        address _usdt,
        address _btc20x,
        address _aggregator
    ) public onlyOwner {
        USDT = IERC20(_usdt);
        BTC20X = IERC20(_btc20x);
        priceFeedETH = AggregatorV3Interface(_aggregator);
    }

    function totalSupply() external view returns (uint256) {
        return BTC20X.totalSupply();
    }

    function getCurrentTime() public view returns (uint256) {
        return block.timestamp;
    }

    function contractBalanceETH() external view returns (uint256) {
        return address(this).balance;
    }

    function getContractTokenBalance() external view returns (uint256) {
        return BTC20X.allowance(owner, address(this));
    }

    function getUserInfo(
        address _user
    )
        public
        view
        returns (
            uint256 _claimAbleAmount,
            address _referrer,
            uint256 _referrerReward,
            bool _claimedAirdrop,
            bool _isExists
        )
    {
        UserInfo storage user = users[_user];
        _claimAbleAmount = user.claimAbleAmount;
        _referrer = user.referrer;
        _referrerReward = user.referrerReward;
        _claimedAirdrop = user.claimedAirdrop;
        _isExists = user.isExists;
    }

    function setReferrerPercentage(
        uint256 _airDropRefPercentage,
        uint256 _referrerPercentage
    ) public onlyOwner {
        airDropRefPercentage = _airDropRefPercentage;
        referrerPercentage = _referrerPercentage;
    }

    function setNewRound(
        uint256 _tokenPerUsd,
        uint256 _presaleTime,
        uint256 _soldToken,
        uint256 _tokenHardCap,
        uint256 _UsdtHardCap,
        uint256 _amountRaised
    ) public onlyOwner {
        tokenPerUsd = _tokenPerUsd;
        presaleTime = _presaleTime;
        soldToken = _soldToken;
        tokenHardCap = _tokenHardCap;
        UsdtHardCap = _UsdtHardCap;
        amountRaised = _amountRaised;
    }
}{
  "optimizer": {
    "enabled": true,
    "runs": 1000000
  },
  "outputSelection": {
    "*": {
      "*": [
        "evm.bytecode",
        "evm.deployedBytecode",
        "devdoc",
        "userdoc",
        "metadata",
        "abi"
      ]
    }
  },
  "libraries": {}
}