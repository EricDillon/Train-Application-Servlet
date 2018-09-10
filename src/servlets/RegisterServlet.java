package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		if (request.getParameter("generatedCaptcha").equals(request.getParameter("txtCaptcha")))
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
				
				PreparedStatement ps = con.prepareStatement("insert into train_users values(?,?,?)");
				ps.setString(1, request.getParameter("txtName"));
				ps.setString(2, request.getParameter("txtPass"));
				ps.setString(3, request.getParameter("txtEmail"));
				
				int o = ps.executeUpdate();
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			catch(Exception e){
				p.println(e);
			}
			finally
			{
				
			}
		}
		else
		{
//			request.setAttribute("CaptchaError", "Invalid Captcha");
//			//response.sendRedirect("Register.jsp");
//			request.getRequestDispatcher("Register.jsp").forward(request, response);
			
			p.println("<script type=\"text/javascript\">");
			p.println("alert('Invalid Captcha. Try again');");
			p.println("location='Register.jsp';");
			p.println("</script>");
		}
	}

}
