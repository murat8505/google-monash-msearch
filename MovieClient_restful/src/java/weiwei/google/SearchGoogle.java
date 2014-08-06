/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.google;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import weiwei.entity.GoogleSearchResult;

/**
 *
 * @author Weiwei
 */
public class SearchGoogle {

    private static final String API_KEY = "AIzaSyBDLFLzKOwYP1NQRRKNjXY02imEK3oT2Ew";//API KEY
    private static final String CX = "017273734144320215856:dknc-smozwk";//CSE ID
    private static final int NUM_RETURNED = 10;

    private static SearchGoogle theInstance;

    public static SearchGoogle getInstance() {
        if (theInstance == null) {
            try {
                theInstance = new SearchGoogle();
            } catch (Exception e) {
                throw new Error("fatal error", e);
            }
        }
        return theInstance;
    }

    public List<GoogleSearchResult> search(String keyword) {
        String urlstr = "https://www.googleapis.com/customsearch/v1?"
                +"key=" + API_KEY
                +"&cx=" + CX
                +"&q="  + keyword
                +"&num="+ NUM_RETURNED;
        URL url = null;
        try {
            url = new URL(urlstr);
        } catch (MalformedURLException ex) {
            Logger.getLogger(SearchGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) url.openConnection();
        } catch (IOException ex) {
            Logger.getLogger(SearchGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn.setRequestMethod("GET");
        } catch (ProtocolException ex) {
            Logger.getLogger(SearchGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn.setRequestProperty("Accept", "application/json");
        BufferedReader br = null;
        try {
            br = new BufferedReader(new InputStreamReader(
                    (conn.getInputStream())));
        } catch (IOException ex) {
            Logger.getLogger(SearchGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }
        String jsonString = getJSONString(br);
        List<GoogleSearchResult> list = jsonStringAnalysis(jsonString);
        conn.disconnect();
        return list;
    }

    private static List<GoogleSearchResult> jsonStringAnalysis(String str) {
        JSONObject jo = new JSONObject().fromString(str);

        JSONArray ja = jo.getJSONArray("items");
        List<GoogleSearchResult> resultList = new ArrayList<>();
        for (int i = 0; i < ja.length(); i++) {
            JSONObject json = ja.getJSONObject(i);
            GoogleSearchResult gsr = new GoogleSearchResult();
            gsr.setLink(json.getString("link"));
            gsr.setSnippet(json.getString("snippet"));
            gsr.setTitle(json.getString("title"));
            resultList.add(gsr);
        }

        return resultList;

    }

    private static String getJSONString(BufferedReader br) {
        String output;
        StringBuffer sb = new StringBuffer();
        System.out.println("Output from Server .... \n");

        try {
            while ((output = br.readLine()) != null) {
                sb.append(output);
            }
        } catch (IOException ex) {
            Logger.getLogger(SearchGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }

        return sb.toString();
    }
}
