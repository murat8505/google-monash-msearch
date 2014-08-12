/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package weiwei.client;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:MovieFacadeREST
 * [weiwei.entity.movie]<br>
 * USAGE:
 * <pre>
 *        NewJerseyClient client = new NewJerseyClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Weiwei
 */
public class JerseyTweetSentimentAnalysisClient {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "https://www.tweetsentimentapi.com/api/";

    public JerseyTweetSentimentAnalysisClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI);
    }

    /**
     * 
     * @param <T>
     * @param responseType
     * @param text
     * @return
     * @throws ClientErrorException 
     */
    public <T> T getTweetSentimentAnalysis(Class<T> responseType, String text) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.queryParam("key", "7a6486863d2672cd9205c3e99e75b756649ed8d6");//set api_key
        resource = resource.queryParam("text", text);//set api_Key
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
