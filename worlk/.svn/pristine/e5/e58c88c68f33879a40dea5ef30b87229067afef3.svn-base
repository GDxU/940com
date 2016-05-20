package com.vinbet.mobile.entity.hkc;

/**
 * Created by Ray on 2014/10/29.
 */
public class PlayCtrl {

    private String gameName;
    private String gameCode;
    private String parentGc;
    private int status;
    private int level;

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getGameCode() {
        return gameCode;
    }

    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    }

    /**
     * 游戏状态,0:显示,1:隐藏,也可直接调用getIsShow方法,返回游戏是否显示
     *
     * @return
     */
    public int getStatus() {
        return status;
    }

    /**
     * 是否显示游戏
     * @return
     */
    public boolean getIsShow() {
        return status == 0;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * 获取父id,空表示自身是父玩法
     * @return
     */
    public String getParentGc() {
        return parentGc;
    }

    public void setParentGc(String parentGc) {
        this.parentGc = parentGc;
    }
}
