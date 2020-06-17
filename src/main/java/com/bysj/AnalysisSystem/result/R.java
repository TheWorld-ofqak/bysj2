package com.bysj.AnalysisSystem.result;

import com.sun.corba.se.spi.ior.ObjectKey;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class R {

    private Boolean success;
    private Integer code;
    private  String message;
    private Map<String,Object> data=new HashMap<>();

    private R(){}


    private static R ok(){
        R r=new R();
        r.setSuccess(true);
        r.setCode(ResultCode.success.getCode());
        r.setMessage(ResultCode.success.getMessage());
        return r;
    }

    private static R error(){
        R r=new R();
        r.setSuccess(false);
        r.setCode(ResultCode.error.getCode());
        r.setMessage(ResultCode.error.getMessage());
        return r;
    }


    public R Success(Boolean success) {
        this.setSuccess(success);
        return this;
    }

    public R Code(Integer code){
        this.setCode(code);
        return this;
    }

    public R message(String message){
        this.setMessage(message);
        return this;
    }

    public R data(Map<String, Object> map){
        this.setData(map);
        return this;
    }




}
