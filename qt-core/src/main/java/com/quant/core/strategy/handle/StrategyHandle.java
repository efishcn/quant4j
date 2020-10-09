package com.quant.core.strategy.handle;

import com.quant.common.domain.vo.BaseInfoEntity;
import com.quant.common.enums.HBOrderType;
import com.quant.core.config.AccountConfig;
import com.quant.core.config.MarketConfig;
import com.quant.core.config.StrategyConfig;
import com.quant.core.trading.TradingApi;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

/**
 * StrategyHandle
 * Created by yang on 2019/8/23.
 */
public abstract class StrategyHandle {


    public StrategyHandle(StrategyHandle handle) {
        this.handle = handle;

    }

    private StrategyHandle handle;


    public abstract HandleResult strategyRequest(TradingApi tradingApi,
                                                 MarketConfig market,
                                                 StrategyConfig config,
                                                 AccountConfig accountConfig,
                                                 int pricePrecision,
                                                 int amountPrecision,
                                                 BigDecimal baseBalance,
                                                 BigDecimal quotaBalance);


    public StrategyHandle getHandle() {
        return handle;
    }

    public BaseInfoEntity getBaseInfo(StrategyConfig config) {
        switch (config.getStrategyType()) {
            case simple:
                return config.getStrategyVo().getBaseInfo();
            case indicator:
                return config.getIndicatorStrategy().getBaseInfo();
            default:
                return config.getStrategyVo() != null ? config.getStrategyVo().getBaseInfo() : config.getIndicatorStrategy().getBaseInfo();
        }
    }

    public void setHandle(StrategyHandle handle) {
        this.handle = handle;
    }

    @AllArgsConstructor
    @Data
    public static class HandleResult {

        /**
         * 订单类型
         */
        HBOrderType hbOrderType;

        /**
         * 计算后的价格 只针对限价 市价不需要传递价格
         */
        BigDecimal Price;

        BigDecimal Amount;


    }
}
