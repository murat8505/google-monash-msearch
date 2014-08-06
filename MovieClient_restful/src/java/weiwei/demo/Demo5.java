/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.demo;

import net.sf.json.JSONObject;
import weiwei.client.NewJerseyClient;

/**
 *
 * @author Weiwei
 */
public class Demo5 {
    public static void main(String[] args) {
        NewJerseyClient movieClient = new NewJerseyClient();
        JSONObject jo = new JSONObject();
        jo.put("imdbnum","123");
        jo.put("title","hello, world");
        jo.put("type", "action");
        jo.put("description", "very interesting");
        jo.put("director", "weiwei");
        jo.put("stars", "weiwei");
        jo.put("coverpath", "./pic/01.jpg");
        //System.out.println(jo.toString());
        String json = jo.toString();
        movieClient.create_JSON(json);
    }
    
}
