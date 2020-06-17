package com.bysj.AnalysisSystem.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class wordsPicture implements Serializable {
    private String specialtxt;
    private int counts;

    public void setCounts(int counts) {
        this.counts = 10;
    }

    public wordsPicture(String specialtxt, int counts) {
        this.specialtxt = specialtxt;
        this.counts = counts;
    }
}
