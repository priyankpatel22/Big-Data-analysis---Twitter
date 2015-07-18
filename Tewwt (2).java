/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tewwt;
/**
 *
 * @author priyankpatel
 */
import java.io.*;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import tewwt.getRetweetInfo;


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
    public static void main(String[] args) throws OAuthMessageSignerException, OAuthExpectationFailedException, OAuthCommunicationException, IOException, ParseException, JSONException, SQLException
    {
        // TODO code application logic here
        //Ask for the user input for the key word to be searched
        Scanner scanner = new Scanner (System.in);
        System.out.print("Enter the keyword to search: ");
        String keyword = scanner.next();
        //Database connection
        Connection conn = null;
        PreparedStatement pst = null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tweets","root","");
            System.out.println("Connected to the database");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        Statement st = conn.createStatement();
        
        //Application Authentication & Authorization to access twitter
        OAuthConsumer oAuthConsumer = new CommonsHttpOAuthConsumer(consumerKeyStr, consumerSecretStr);
        oAuthConsumer.setTokenWithSecret(accessTokenStr, accessTokenSecretStr);
        
        SentiStrength sentiStrength = new SentiStrength();
        String ssthInitialisation[] = {"sentidata", "/Users/priyankpatel/Downloads/SentStrength_Data_Sept2011/", "explain"};
        sentiStrength.initialise(ssthInitialisation);
        
        String max_id = "", url, score;
        
        //--------------------------------------INSERT DATA INTO MAIN TABLE-------------------------------//
        
        String sqlquery = "insert into tweetsInfo (SR_NUMBER, TWEET_ID, PRIMARY_TWEET_ID, TWEET_TIME, USER_NAME, USER_ID,"
        + " NUMBER_OF_RETWEETS, NUMBER_OF_FAVORITE, TWEET_TEXT, POSITIVE_STRENGTH, NEGATIVE_STRENGTH, INCLUDED_URL, HASHTAG) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        
        //----------------------------------INSERT DATA INTO PRIMARY TWEET ID TABLE-----------------------//
        //String sqlquery = "insert into primaryTweetInfo (SR_NUMBER, PRIMARY_TWITTER) values (?,?)";
        //491602863068426240
        
        pst = conn.prepareStatement(sqlquery);
        
        int flag = 0, k = 1, positiveStrength = 0, negativeStrength = 0;
        //max_id = "483957128441643008";
        //loop to iterate through timeline
        for(int  j = 0; j < 1000; j++)
        {
            if(flag == 0)
            {
                //url for the first time request
                //count can be <=100 but for better speed kept 10
                url = "https://api.twitter.com/1.1/search/tweets.json?&q="+keyword+"&count=1";
                flag = 1;
            }
            else
            {
                //url for all the requests after first request
                System.out.print("MazID: ");
                System.out.println(max_id);
                long ln = Long.parseLong(max_id);
                ln--;
                max_id = String.valueOf(ln);
                url = "https://api.twitter.com/1.1/search/tweets.json?max_id="+max_id+"&q="+keyword+"&count=1";
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
                System.out.print((char)c);
            }
            rd.close();
            //parse required data from JSON format
            //if(buff.contains(""))
            JSONObject js = new JSONObject(buff);
            JSONArray tweets = js.getJSONArray("statuses");
            JSONObject tweet;
            
            
            
            //pritnt required data from the array
            for(int i=0; i<tweets.length(); i++)
            {
                String urlAddress = "";
                String hashtagString = "";
                tweet = tweets.getJSONObject(i);
                
                
                if(tweet.getInt("retweet_count") > 0)
                {
                    
                    //Compute the Senti strenght data for each tweet
                    String str = tweets.getJSONObject(i).getString("text");
                    
                    JSONArray urlInfo = tweet.getJSONObject("entities").getJSONArray("urls");
                    if(urlInfo.length() == 1)
                    {
                        urlAddress = processurlAddress(urlInfo.join(""));
                    }
                    
                    JSONArray hashtag = tweet.getJSONObject("entities").getJSONArray("hashtags");
                    if(hashtag.length() == 1)
                    {
                        hashtagString = processhashtag(hashtag.join(""));
                    }
                    
                    score = sentiStrength.computeSentimentScores(str);
                    positiveStrength = Integer.parseInt(score.substring(0, 1));
                    negativeStrength = Integer.parseInt(score.substring(2, 4));
                    //System.out.println("");
                    //System.out.println("//////////////");
                    //System.out.println(tweet.getInt("retweet_count"));
                    //System.out.println(tweets.getJSONObject(i).getJSONObject("retweeted_status").getString("id_str"));
                    //Get the retweet information for each tweet
                    String userId = tweet.getString("id_str");
                    //System.out.println(userId);
                    //String firstRetweeterId = computeRetweeterInfo(userId);
                    //System.out.println(firstRetweeterId);
                    pst.setInt(1, k++);
                    pst.setString(2, tweet.getString("id_str"));
                    try
                    {
                        pst.setString(3, tweets.getJSONObject(i).getJSONObject("retweeted_status").getString("id_str"));
                    }
                    catch(Exception e)
                    {
                        pst.setString(3, tweet.getString("id_str"));
                    }
                    pst.setString(4, tweet.getString("created_at"));
                    pst.setString(5, tweets.getJSONObject(i).getJSONObject("user").getString("name"));
                    pst.setString(6, tweets.getJSONObject(i).getJSONObject("user").getString("id_str"));
                    pst.setInt(7, tweet.getInt("retweet_count"));
                    pst.setInt(8, tweet.getInt("favorite_count"));
                    pst.setString(9, str);
                    pst.setInt(10, positiveStrength);
                    pst.setInt(11, negativeStrength);
                    pst.setString(12, urlAddress);
                    pst.setString(13, hashtagString);
                    
                    pst.executeUpdate();
                    
                    //System.out.println(k+++")"+"User_Name: "+tweets.getJSONObject(i).getJSONObject("user").getString("name") + " Post_ID = "+tweet.getString("id_str") +" at " + tweet.getString("created_at"));
                    //System.out.println(tweets.getJSONObject(i).getString("text") + "\n");
                    //System.out.println("#########################################################");
                }
                max_id  = tweets.getJSONObject(i).getString("id_str");
            }
        }
        //getRetweetInfo getretweetinfo = new getRetweetInfo();
        //getretweetinfo.getretweets();
    }
    
    private static String processurlAddress(String join)
    {
        int index, endIndex;
        String expandedUrl;
        endIndex = join.indexOf('"', 17);
        return join.substring(17, endIndex);
    }
    
    private static String processhashtag(String join)
    {
        int begin;
        begin = join.indexOf("text") + 7;
        return join.substring(begin,  join.indexOf('"', 1+begin));
    }
    
}



//url = "https://api.twitter.com/1.1/statuses/retweeters/ids.json?id=468356214561054721&count=100";
//url = "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=119058143&include_rts=1&count=50";
//String str = "fjbdjdbs qdjhh %^&*cds,,fwefew";
//               byte[] bytes = str.getBytes("UTF-16");
//           System.out.println(new String(bytes, Charset.forName("UTF-16")));
