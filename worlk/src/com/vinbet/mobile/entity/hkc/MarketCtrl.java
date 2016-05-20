package com.vinbet.mobile.entity.hkc;

/**
 * Created by Ray on 2014/10/29.
 */
public class MarketCtrl {

    private int seal;
    private int nseal;
    private boolean hpStatus;
    private long sealTime;
    private long nsealTime;
    private String issue;

    public int getSeal() {
        return seal;
    }

    public void setSeal(int seal) {
        this.seal = seal;
    }

    public int getNseal() {
        return nseal;
    }

    public void setNseal(int nseal) {
        this.nseal = nseal;
    }

    /**
     * 盘口是否封单
     *
     * @return
     */
    public boolean isHpStatus() {
        return hpStatus;
    }

    public void setHpStatus(int v) {
        hpStatus = v == 0;
    }

    /**
     * 特码封盘时间
     *
     * @return
     */
    public long getSealTime() {
        return sealTime;
    }

    public void setSealTime(long sealTime) {
        this.sealTime = sealTime;
    }

    /**
     * 非特码封盘时间
     *
     * @return
     */
    public long getNsealTime() {
        return nsealTime;
    }

    public void setNsealTime(long nsealTime) {
        this.nsealTime = nsealTime;
    }
    
    /**
     * 当前期
     *
     * @return
     */
	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}
}
