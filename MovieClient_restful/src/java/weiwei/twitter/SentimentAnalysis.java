/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.twitter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.json.JSONObject;
import weiwei.entity.SentimentData;

/**
 *
 * @author Weiwei
 */
public class SentimentAnalysis {
    private static String API_KEY = "2hxe5v4eUqvvN2VlKyzA";
    
    private static SentimentAnalysis theInstance;
    
    /**
     * Return the singleton instance of SentimentAnalysis
     * @return 
     */
    public static SentimentAnalysis getInstance(){
        if (theInstance == null) {
            try {
                theInstance = new SentimentAnalysis();
            } catch (Exception e) {
                throw new Error("fatal error", e);
            }
        }
        return theInstance;
    }
    
    public SentimentData parseString(String jsonString) {
        JSONObject jo = new JSONObject().fromString(jsonString);
        SentimentData sd = new SentimentData();
        sd.setText(jo.getString("text"));
        sd.setMood(jo.getString("mood"));
        sd.setProb(jo.getDouble("prob"));        
        return sd;
    }
    
    /**
     * 
     * @param text Text for which you want the sentiment. The limit on the text is 360 characters
     * @return the result as the format of JSON string
     */
    public String getSentiment(String text){
        String urlstr = "https://app.viralheat.com/social/api/sentiment?"
                + "&api_key="+API_KEY
                + "&text="+text;
        String result = getResultAsStringFormat(urlstr, text);
        return result;
    }
    
    /**
     * 
     * @param text Text for which you want the sentiment. The limit on the text is 360 characters.
     * @param mood 1 for Positive, -1 for negative and 0 for neutral
     * @return 
     */
    public String getSentimentTrain(String text, int mood){
        String urlstr = "https://app.viralheat.com/social/api/sentiment?"
                + "&api_key="+API_KEY
                + "&text="+text
                + "&mood="+mood;
        String result = getResultAsStringFormat(urlstr, text);
        return result;
    }
    
    
    private static String getResultAsStringFormat(String urlstr, String text){
        BufferedReader br = null;
        try {
            URL url = new URL(urlstr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } catch (MalformedURLException ex) {
            System.out.println(urlstr+"is not available!");
            Logger.getLogger(SentimentAnalysis.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(SentimentAnalysis.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        String output;
        StringBuffer sb = new StringBuffer();
        //System.out.println("Output from Server .... \n");

        try {
            while ((output = br.readLine()) != null) {
                sb.append(output);
            }
        } catch (IOException ex) {
            Logger.getLogger(SentimentAnalysis.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb.toString();
    }
        
    
}
