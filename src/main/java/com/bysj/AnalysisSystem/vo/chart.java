package com.bysj.AnalysisSystem.vo;


import lombok.Data;

import java.io.Serializable;

@Data
public class chart implements Serializable {
    private  String  name;
    private  String goodnumber;
    private  String  midnumber;
    private  String  lownumber;

}
