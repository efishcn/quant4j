package com.quant.common.enums;

public enum BuyType {
    buyAll(1),
    buyCustom(0);


    Integer type;

    BuyType(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
