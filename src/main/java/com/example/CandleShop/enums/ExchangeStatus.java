package com.example.CandleShop.enums;

public enum ExchangeStatus {
    PENDING("Chờ xác nhận"),
    APPROVED("Đã duyệt"),
    COLLECTED("Đã thu gom"),
    COMPLETED("Hoàn thành"),
    CANCELLED("Đã hủy");

    private final String displayValue;

    ExchangeStatus(String displayValue) {
        this.displayValue = displayValue;
    }

    public String getDisplayValue() {
        return displayValue;
    }
}
