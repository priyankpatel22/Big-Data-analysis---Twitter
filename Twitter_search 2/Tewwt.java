/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tewwt;
/**
 *
 * @author priyankpatel
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Tewwt 
{
    /**
     * @param args the command line arguments
     */
    //Consumer key and access token for my twitter account
    static String consumerKeyStr = "6ewOeEa7VPwkSY7YJb1Q";
    static String consumerSecretStr = "xbBygeW34yJx25WAPSyOhG39TxNHuT1WXpce5ZYY";
    static String accessTokenStr = "2345176225-eYogvXjUIEAFtEhwsuQZ5yFjULpbf9OK80FdJxb";
    static String accessTokenSecretStr = "JtqDDoccLjPxdqleZHQgZ5ZczwO2VNQGzB3Zh6mgdKh04";
    public static void main(String[] args) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException, IOException, ParseException, JSONException 
    {
        // TODO code application logic here
        //Ask for the user input for the key word to be searched
        Scanner scanner = new Scanner (System.in);
        System.out.print("Enter the keyword to search: ");  
        String keyword = scanner.next();
        
        //Application Authentication & Authorization to access twitter
        OAuthConsumer oAuthConsumer = new CommonsHttpOAuthConsumer(consumerKeyStr, consumerSecretStr);
        oAuthConsumer.setTokenWithSecret(accessTokenStr, accessTokenSecretStr);
        
        String max_id = "", url;
        int flag = 0, k = 1;
       //loop to iterate through timeline 
        for(int  j = 0; j < 100; j++)
        {
            if(flag == 0)
            {
                //url for the first time request
                //count can be <=100 but for better speed kept 10
                    url = "https://api.twitter.com/1.1/search/tweets.json?&q="+keyword+"&count=10";
                    flag = 1;
            } 
            else
            {
                //url for all the requests after first request
                long ln = Long.parseLong(max_id);
                ln--;
                max_id = String.valueOf(ln);
                url = "https://api.twitter.com/1.1/search/tweets.json?max_id="+max_id+"&q="+keyword+"&count=10";
            }
            //retrive data 
            HttpGet httpGet = new HttpGet(url);        
            oAuthConsumer.sign(httpGet);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse httpResponse = httpClient.execute(httpGet);
            BufferedReader rd = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent()));
            int c;  
            String buff = "";
            while((c=rd.read())!=-1)  
            {  
                buff += (char)c;  
            }  
            rd.close(); 
            //parse required data from JSON format
            JSONObject js = new JSONObject(buff);
            JSONArray tweets = js.getJSONArray("statuses");
            JSONObject tweet;
        
             //pritnt required data from the array
            for(int i=0; i<tweets.length(); i++) 
            {
                tweet = tweets.getJSONObject(i);
                System.out.println(k+++")"+"User_Name: "+tweets.getJSONObject(i).getJSONObject("user").getString("name") + " Post_ID = "+tweet.getString("id_str") +" at " + tweet.getString("created_at"));
                System.out.println(tweets.getJSONObject(i).getString("text") + "\n");
                max_id  = tweets.getJSONObject(i).getString("id_str"); 
            } 
        } 
    }
}
