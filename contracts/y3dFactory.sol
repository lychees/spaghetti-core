pragma solidity ^0.5.0;
import './y3dPool.sol';
import './y3dToken.sol';

interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

contract y3dFactory {
    y3dToken public y3d;
    y3dPool public mkrPool;
    y3dPool public compPool;
    y3dPool public linkPool;
    y3dPool public wethPool;
    y3dPool public snxPool;
    y3dPool public lendPool;
    y3dPool public yfiPool;
    y3dPool public yfiiPool;    
    y3dPool public wbtcPool;
    y3dPool public uniswapPool;
    address public uniswap;
    IUniswapV2Factory public uniswapFactory = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);

    constructor() public {
        y3d = new y3dToken(address(this));
    }

    function initMKR() public {
        require(address(mkrPool) == address(0), "Already initialized");
        mkrPool = new y3dPool(address(y3d), 0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2, 7 days, now + 24 hours);
        mkrPool.setRewardDistribution(address(this));
        y3d.transfer(address(mkrPool), 1000000000000000000000000);
        mkrPool.notifyRewardAmount(y3d.balanceOf(address(mkrPool)));
        mkrPool.setRewardDistribution(address(0));
        mkrPool.renounceOwnership();
    }

    function initCOMP() public {
        require(address(compPool) == address(0), "Already initialized");
        compPool = new y3dPool(address(y3d), 0xc00e94Cb662C3520282E6f5717214004A7f26888, 7 days, now + 24 hours);
        compPool.setRewardDistribution(address(this));
        y3d.transfer(address(compPool), 1000000000000000000000000);
        compPool.notifyRewardAmount(y3d.balanceOf(address(compPool)));
        compPool.setRewardDistribution(address(0));
        compPool.renounceOwnership();
    }

    function initLINK() public {
        require(address(linkPool) == address(0), "Already initialized");
        linkPool = new y3dPool(address(y3d), 0x29E240CFD7946BA20895a7a02eDb25C210f9f324, 7 days, now + 24 hours);
        linkPool.setRewardDistribution(address(this));
        y3d.transfer(address(linkPool), 1000000000000000000000000);
        linkPool.notifyRewardAmount(y3d.balanceOf(address(linkPool)));
        linkPool.setRewardDistribution(address(0));
        linkPool.renounceOwnership();
    }

    function initLEND() public {
        require(address(lendPool) == address(0), "Already initialized");
        lendPool = new y3dPool(address(y3d), 0x80fB784B7eD66730e8b1DBd9820aFD29931aab03, 7 days, now + 24 hours);
        lendPool.setRewardDistribution(address(this));
        y3d.transfer(address(lendPool), 1000000000000000000000000);
        lendPool.notifyRewardAmount(y3d.balanceOf(address(lendPool)));
        lendPool.setRewardDistribution(address(0));
        lendPool.renounceOwnership();
    }

    function initSNX() public {
        require(address(snxPool) == address(0), "Already initialized");
        snxPool = new y3dPool(address(y3d), 0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F, 7 days, now + 24 hours);
        snxPool.setRewardDistribution(address(this));
        y3d.transfer(address(snxPool), 1000000000000000000000000);
        snxPool.notifyRewardAmount(y3d.balanceOf(address(snxPool)));
        snxPool.setRewardDistribution(address(0));
        snxPool.renounceOwnership();
    }

    function initYFI() public {
        require(address(yfiPool) == address(0), "Already initialized");
        yfiPool = new y3dPool(address(y3d), 0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e, 7 days, now + 24 hours);
        yfiPool.setRewardDistribution(address(this));
        y3d.transfer(address(yfiPool), 1000000000000000000000000);
        yfiPool.notifyRewardAmount(y3d.balanceOf(address(yfiPool)));
        yfiPool.setRewardDistribution(address(0));
        yfiPool.renounceOwnership();
    }

    function initWETH() public {
        require(address(wethPool) == address(0), "Already initialized");
        wethPool = new y3dPool(address(y3d), 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, 7 days, now + 24 hours);
        wethPool.setRewardDistribution(address(this));
        y3d.transfer(address(wethPool), 1000000000000000000000000);
        wethPool.notifyRewardAmount(y3d.balanceOf(address(wethPool)));
        wethPool.setRewardDistribution(address(0));
        wethPool.renounceOwnership();
    }

    function initWBTC() public {
        require(address(wbtcPool) == address(0), "Already initialized");
        wbtcPool = new y3dPool(address(y3d), 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599, 7 days, now + 24 hours);
        wbtcPool.setRewardDistribution(address(this));
        y3d.transfer(address(wbtcPool), 1000000000000000000000000);
        wbtcPool.notifyRewardAmount(y3d.balanceOf(address(wbtcPool)));
        wbtcPool.setRewardDistribution(address(0));
        wbtcPool.renounceOwnership();
    }

    function initYFII() public {
        require(address(yfiiPool) == address(0), "Already initialized");
        yfiiPool = new y3dPool(address(y3d), 0xa1d0E215a23d7030842FC67cE582a6aFa3CCaB83, 7 days, now + 24 hours);
        yfiiPool.setRewardDistribution(address(this));
        y3d.transfer(address(yfiiPool), 1000000000000000000000000);
        yfiiPool.notifyRewardAmount(y3d.balanceOf(address(yfiiPool)));
        yfiiPool.setRewardDistribution(address(0));
        yfiiPool.renounceOwnership();
    }

    function initUNI() public {
        require(address(uniswapPool) == address(0), "Already initialized");
        uniswap = uniswapFactory.createPair(0x5dbcF33D8c2E976c6b560249878e6F1491Bca25c, address(y3d));
        uniswapPool = new y3dPool(address(y3d), uniswap, 21 days, now + 48 hours);
        uniswapPool.setRewardDistribution(address(this));
        y3d.transfer(address(uniswapPool), 7000000000000000000000000);
        uniswapPool.notifyRewardAmount(y3d.balanceOf(address(uniswapPool)));
        uniswapPool.setRewardDistribution(address(0));
        uniswapPool.renounceOwnership();
    }
}
