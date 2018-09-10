package servlets;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from train_users where username='"+request.getParameter("txtName") +
					"' and password='"+request.getParameter("txtPass")+ "'");
			
			if (rs.next())
			{
				HttpSession sess = request.getSession();
				sess.setAttribute("Username", request.getParameter("txtName"));
				
				request.getRequestDispatcher("Menu.jsp").forward(request, response);;
			}
			else
			{
				p.println("<script type=\"text/javascript\">");
				p.println("alert('Invalid username/password combination Try again');");
				p.println("location='Login.jsp';");
				p.println("</script>");
			}

		}
		catch(Exception e){
			p.println(e);
		}
		
	}

}
