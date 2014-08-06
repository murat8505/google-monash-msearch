/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.demo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import weiwei.entity.GoogleSearchResult;

/**
 *
 * @author Weiwei
 */
public class Demo6 {

    public static void main(String[] args) throws Exception {
        String API_KEY = "AIzaSyBDLFLzKOwYP1NQRRKNjXY02imEK3oT2Ew";
        String CX = "017273734144320215856:dknc-smozwk";
        String QUERY = "Developer";
        String NUM_RETURNED = "3";
        
        String urlstr = "https://www.googleapis.com/customsearch/v1?"
                +"key="+API_KEY
                +"&cx="+CX
                +"&q="+QUERY
                +"&num="+NUM_RETURNED;
        
        //String encoded = URLEncoder.encode(urlstr, "UTF-8");
        
        URL url = new URL(urlstr);
                
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");
        BufferedReader br = new BufferedReader(new InputStreamReader(
                (conn.getInputStream())));

        String output;
        StringBuffer sb = new StringBuffer();
        System.out.println("Output from Server .... \n");
        
        
        while ((output = br.readLine()) != null) {
            
            //System.out.println(output);
            sb.append(output);
                       
            if (output.contains("\"link\": \"")) {
                String link = output.substring(output.indexOf("\"link\": \"") + ("\"link\": \"").length(), output.indexOf("\","));
                System.out.println(link);       //Will print the google search links
            }

        }
        
        JSONObject jo = new JSONObject().fromString(sb.toString());
        //String items = jo.getString("items");
        JSONArray ja = jo.getJSONArray("items");
//        System.out.println(items);
        
        System.out.println("--------------");
        List<GoogleSearchResult> resultList = new ArrayList<GoogleSearchResult>();
        for (int i = 0; i < ja.length(); i++) {
            JSONObject json = ja.getJSONObject(i);
            GoogleSearchResult gsr = new GoogleSearchResult();
            gsr.setLink(json.getString("title"));
            gsr.setSnippet(json.getString("snippet"));
            gsr.setTitle(json.getString("link"));
            resultList.add(gsr);
//          System.out.println(ja.get(i));
        }
        
        for (GoogleSearchResult g : resultList) {
            System.out.println(g.getSnippet());
        }

        conn.disconnect();
    }
}