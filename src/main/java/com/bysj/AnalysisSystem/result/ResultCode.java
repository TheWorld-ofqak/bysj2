package com.bysj.AnalysisSystem.result;

import lombok.Data;


public enum ResultCode {

    //枚举类型将会有很多个
     success(200,"通常意义的成功"),
     error(204,"失败");



     private Integer code;
     private String message;

    ResultCode(Integer code,String message) {
        this.code = code;
        this.message=message;
    }

    public Integer getCode() {
        return code;
    }


    public String getMessage() {
        return message;
    }


}
