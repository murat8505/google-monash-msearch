/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.demo;

import java.util.List;
import weiwei.entity.GoogleSearchResult;
import weiwei.google.SearchGoogle;

/**
 *
 * @author Weiwei
 */
public class Demo7 {
    public static void main(String[] args) {
        List<GoogleSearchResult> list = SearchGoogle.getInstance().search("hello+world");
        for (GoogleSearchResult g : list) {
            System.out.println("Title: "+g.getTitle());
            System.out.println("Link:" + g.getLink());
        }
    }
}
