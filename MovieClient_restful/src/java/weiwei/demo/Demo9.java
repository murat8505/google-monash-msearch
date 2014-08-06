/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.demo;

import weiwei.twitter.SentimentAnalysis;

/**
 *
 * @author Weiwei
 */
public class Demo9 {
    public static void main(String[] args) {
        String jsonstr = SentimentAnalysis.getInstance().getSentiment("china");
        System.out.println(jsonstr);
        
        String str2 = SentimentAnalysis.getInstance().getSentimentTrain("China", 1);
        System.out.println(str2);
    }
}
