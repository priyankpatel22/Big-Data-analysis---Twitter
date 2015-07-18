/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tewwt;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
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
import uk.ac.wlv.sentistrength.SentiStrength;

/**
 *
 * @author priyankpatel
 */
public class getRetweetInfo 
{
    static String consumerKeyStr = "6ewOeEa7VPwkSY7YJb1Q";
    static String consumerSecretStr = "xbBygeW34yJx25WAPSyOhG39TxNHuT1WXpce5ZYY";
    static String accessTokenStr = "2345176225-eYogvXjUIEAFtEhwsuQZ5yFjULpbf9OK80FdJxb";
    static String accessTokenSecretStr = "JtqDDoccLjPxdqleZHQgZ5ZczwO2VNQGzB3Zh6mgdKh04";
   
    void getretweets() throws SQLException, OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException, IOException 
    {
        //Database connection
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet res;
        String returnValue = null;
        String max_id = "", score;
         String url = null;
         OAuthConsumer oAuthConsumer = new CommonsHttpOAuthConsumer(consumerKeyStr, consumerSecretStr);
        oAuthConsumer.setTokenWithSecret(accessTokenStr, accessTokenSecretStr);
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tweets","root","");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        Statement st = conn.createStatement();
        
        int numberOfEntries = 0;
        int noofRetweets;
        String sqlquery = "SELECT COUNT(*) FROM tweetsInfo";
        pst = conn.prepareStatement(sqlquery);
        res = pst.executeQuery();
        
        while (res.next())
        {
            numberOfEntries = res.getInt(1);
        }
        
        for(int i = 1; i <= numberOfEntries; i++)
        {
            
            noofRetweets = 0;
            String retweetUserId = null;
            sqlquery = "SELECT TWEET_ID, NUMBER_OF_RETWEETS FROM tweetsInfo WHERE SR_NUMBER ="+i;
            pst = conn.prepareStatement(sqlquery);
            res = pst.executeQuery();
            
            while (res.next())
            {
                retweetUserId = res.getString("TWEET_ID");
                noofRetweets = res.getInt("NUMBER_OF_RETWEETS");
            
                if(noofRetweets > 0)
                {
                    returnValue = querytwitter(retweetUserId);
                }
            }
        }
        
        /*
//                sqlquery = "select TWEET_ID from tweetsInfo where SR_NUMBER = ;
        pst = conn.prepareStatement(sqlquery);
        
        int flag = 0, k = 1, positiveStrength = 0, negativeStrength = 0;
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
                //System.out.print((char)c);
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
                
                //Compute the Senti strenght data for each tweet
                String str = tweets.getJSONObject(i).getString("text");
                score = sentiStrength.computeSentimentScores(str);
                positiveStrength = Integer.parseInt(score.substring(0, 1));
                negativeStrength = Integer.parseInt(score.substring(2, 4));
                
                //Get the retweet information for each tweet
                String userId = tweet.getString("id_str");
                System.out.println(userId);
                //String firstRetweeterId = computeRetweeterInfo(userId);
                //System.out.println(firstRetweeterId);
                pst.setInt(1, k++);
                pst.setString(2, tweet.getString("id_str"));
                pst.setString(3, tweet.getString("created_at"));
                pst.setString(4, tweets.getJSONObject(i).getJSONObject("user").getString("name"));
                pst.setString(5, tweets.getJSONObject(i).getJSONObject("user").getString("id_str"));
                pst.setInt(6, tweet.getInt("retweet_count"));
                pst.setInt(7, tweet.getInt("favorite_count"));
                pst.setString(8, str);
                pst.setInt(9, positiveStrength);
                pst.setInt(10, negativeStrength);
                
                pst.executeUpdate();
                
                //System.out.println(k+++")"+"User_Name: "+tweets.getJSONObject(i).getJSONObject("user").getString("name") + " Post_ID = "+tweet.getString("id_str") +" at " + tweet.getString("created_at"));
                //System.out.println(tweets.getJSONObject(i).getString("text") + "\n");
                max_id  = tweets.getJSONObject(i).getString("id_str"); 
            } 
        }
        */
    }

    private String querytwitter(String retweetUserId) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException, IOException 
    {
        //Application Authentication & Authorization to access twitter
        OAuthConsumer oAuthConsumer = new CommonsHttpOAuthConsumer(consumerKeyStr, consumerSecretStr);
        oAuthConsumer.setTokenWithSecret(accessTokenStr, accessTokenSecretStr);
        
        String url = null, value = null;
        url = "https://api.twitter.com/1.1/statuses/retweeters/ids.json?id="+retweetUserId+"&count=100";
       
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
                System.out.print((char)c);
            }
            rd.close(); 
        return value;
    }

    

}
