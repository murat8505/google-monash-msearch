/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package weiwei.twitter;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author Weiwei
 */
public class Demo8 {

    public static void main(String[] args) {
        
        Properties properties = new Properties();
        try {
            InputStream in = Demo8.class.getResourceAsStream("/weiwei/twitter/twitter4j.properties");
            properties.load(in);

        } catch (IOException e) {
            System.err.println("There was an error reading properties" + e.getCause()
                    + " : " + e.getMessage());
            System.exit(1);
        }
        
        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey(properties.getProperty("oauth.consumerKey"))
                .setOAuthConsumerSecret(properties.getProperty("oauth.consumerSecret"))
                .setOAuthAccessToken(properties.getProperty("oauth.accessToken"))
                .setOAuthAccessTokenSecret(properties.getProperty("oauth.accessTokenSecret"));
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();

        //Twitter twitter = new TwitterFactory().getInstance();
        try {
            Query query = new Query("lucy");
            QueryResult result;
            do {
                result = twitter.search(query);
                List<Status> tweets = result.getTweets();
                for (Status tweet : tweets) {
                    //System.out.println("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                    System.out.println(tweet.getUser().getScreenName());
                    System.out.println(tweet.getText());
                    System.out.println(tweet.getCreatedAt());
                }
            } while ((query = result.nextQuery()) != null);
            System.exit(0);
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Failed to search tweets: " + te.getMessage());
            System.exit(-1);
        }
    }

}
