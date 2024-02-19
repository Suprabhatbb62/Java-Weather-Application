package weatherpkg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Scanner;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/weather")
public class Weather extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		String city_input=req.getParameter("city");
//		System.out.println(city_input);
		//api info
		String apiKey="2448c7140ad18a0494aed4bc277f574b";
		String city=req.getParameter("city");
		String apiUrl="https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey;
		//api integration
		URL url=new URL(apiUrl);
		
		HttpURLConnection con=(HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		//read data from network
		InputStream inputstream=con.getInputStream();
		InputStreamReader reader=new InputStreamReader(inputstream);
		//store data(Stringbuilder becz its mutable)
		StringBuilder sb=new StringBuilder();
		//taking input from reader
		Scanner sc=new Scanner(reader);
		while(sc.hasNext()) {
			sb.append(sc.nextLine());
		}
		sc.close();
		//typecasting sb to json (import json jar)
		Gson gson=new Gson();
		JsonObject jsonObject=gson.fromJson(sb.toString(), JsonObject.class);
		//storing data from json to variables
		//Date & Time
        long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
        String date = new Date(dateTimestamp).toString();
        
        //Temperature
        double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
        int temperatureCelsius = (int) (temperatureKelvin - 273.15);  // F to D
       
        //Humidity
        int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
        
        //Wind Speed
        double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
        
        //Weather Condition
        String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
        //sending data to jsp
        req.setAttribute("date", date);
        req.setAttribute("city", city);
        req.setAttribute("temperature", temperatureCelsius);
        req.setAttribute("weatherCondition", weatherCondition);
        req.setAttribute("humidity", humidity);
        req.setAttribute("windSpeed", windSpeed);
        
        con.disconnect();
        
        //forward req to weather.jsp for render data
        req.getRequestDispatcher("index.jsp").forward(req, res);
	}

}
