package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HttpUtil {

	public static void forward(HttpServletRequest request, HttpServletResponse response , String URL) throws  ServletException
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher(URL);
		try {
		dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
