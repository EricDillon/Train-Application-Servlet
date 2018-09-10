package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.*;

/**
 * Servlet implementation class AddPassengerServlet
 */
@WebServlet("/AddPassengerServlet")
public class AddPassengerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPassengerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			Train train = new Train(Integer.parseInt(request.getParameter("trainNo")), request.getParameter("trainName"), 
					request.getParameter("trainSource"), request.getParameter("trainDestination"), Double.parseDouble(request.getParameter("trainPrice")));
			SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			String travelDate = request.getParameter("travelDate");
			
			Ticket t = new Ticket(travelDate, train); 
			
			long creditCardNum = Long.parseLong(request.getParameter("cardNum"));


			
			String cardExpDate = String.format("%02d", Integer.parseInt(request.getParameter("cardExpMonth"))) +"/"+ request.getParameter("cardExpYear");
			
			SimpleDateFormat cardDf = new SimpleDateFormat("MM/yyyy");
			
			
			if (travelDate.compareTo(String.valueOf(df.format(new Date()))) < 0) 
			{
				throw new Exception("3");
				
			}
			
			
			if (String.valueOf(request.getParameter("cardNum")).length() != 16)
			{
				throw new Exception("1");
			}
			
			int compared = cardExpDate.compareTo(String.valueOf(cardDf.format(new Date())));
			if (compared < 0)
			{
				throw new Exception ("2");
			}
			
			///
			int passengers =  Integer.parseInt(request.getParameter("passengerCount")); 
			////
			for (int i = 0 ; i <= passengers; i++)
			{
				
				if (!request.getParameter("txtName" + i).isEmpty() && 
						!request.getParameter("txtAge" + i).isEmpty() && 
						!request.getParameter("txtGender" + i).isEmpty())
				{
					t.addPassenger(request.getParameter("txtName" + i), Integer.parseInt(request.getParameter("txtAge" + i)), 
						request.getParameter("txtGender" + i).charAt(0));
				}
				
			}
			

			HttpSession sess = request.getSession();
			sess.setAttribute("tickObj", t);
			RequestDispatcher rd = request.getRequestDispatcher("/finalForm.jsp");
		    rd.forward(request,response);
		}
		catch (Exception e)
		{
			PrintWriter p = response.getWriter();
			switch (e.getMessage())
			{
			case "1":
				{
					p.println("<script type=\"text/javascript\">");
					p.println("alert('Invalid Credit Card number');");
					p.println("location='" + request.getHeader("Referer") + "';");
					p.println("</script>");
					
					break;
				}
			case "2":
			{
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Card is expired. Please enter a valid expiration date');");
				p.println("location='" + request.getHeader("Referer") + "';");
				p.println("</script>");
				
				break;
			}
			case "3":
			{
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Travel Date is in the past. Please enter a valid travel Date');");
				p.println("location='" + request.getHeader("Referer") + "';");
				p.println("</script>");
				
				break;
			}
				
			default :
				{
					e.printStackTrace();
					
					p.println("<script type=\"text/javascript\">");
					p.println("alert('There was a problem creating your ticket. Please double check the info you added and try again');");
					p.println("location='" + request.getHeader("Referer") + "';");
					p.println("</script>");
				}
			}
			
		}
		
	}

}
