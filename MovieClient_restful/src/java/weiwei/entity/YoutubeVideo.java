/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.entity;

/**
 *
 * @author Weiwei
 */
public class YoutubeVideo {

    private String videoNum;
    private String videoTitle;
    private String thumbnail;

    private String description;


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVideoNum() {
        return videoNum;
    }

    public void setVideoNum(String videoNum) {
        this.videoNum = videoNum;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

}
