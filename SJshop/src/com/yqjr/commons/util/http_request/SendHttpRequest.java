package com.yqjr.commons.util.http_request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class SendHttpRequest {
	public static final String URL  = "http://192.168.1.111:8989/ECservice/wap/";
    /** HTTP GET method */
    public static final String METHOD_GET = "GET";
    /** HTTP POST method */
    public static final String METHOD_POST = "POST";
	public static String sendRequest(String urlStr,String msg,String method) throws IOException {
		BufferedReader in = null;
		PrintWriter  out = null;
		String result = "";
		try{
			URL url = new URL(urlStr);
			HttpURLConnection  conn =  (HttpURLConnection )url.openConnection();
			
			if(method.equals("GET")){
				conn.setConnectTimeout(5*1000);
				conn.setRequestMethod(method);
			}else{
				conn.setDoOutput(true);
		        conn.setDoInput(true);
		        conn.setRequestMethod(method);
		        out = new PrintWriter(conn.getOutputStream());
		        out.print(msg);
		        out.flush();
			}
	        
	        in  = new BufferedReader(
	                new InputStreamReader(conn.getInputStream()));
	        String line;
	        result = "";
	        while ((line = in.readLine()) != null) {
	        	result += line;
	        }
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(out!=null){
					out.close();
			}
		}
        return result;
	}
}
