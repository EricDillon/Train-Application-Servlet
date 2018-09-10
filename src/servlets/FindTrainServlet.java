package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Train;
import com.TrainDAO;

/**
 * Servlet implementation class FindTrainServlet
 */
@WebServlet("/FindTrainServlet")
public class FindTrainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindTrainServlet() {
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
		TrainDAO traindao = new TrainDAO();
		int id = 0;
		if (!request.getParameter("txtTrainID").isEmpty())
		{
			id = Integer.parseInt(request.getParameter("txtTrainID"));
		}
		
		List<Train> trains = new ArrayList<Train>();
		String source = request.getParameter("trainSource");
		String destination = request.getParameter("trainDestination");
		
		try {
			if (id != 0)
			{
				trains = traindao.getTrains(id);
			}
			else if (source != null && destination != null)
			{
				trains = traindao.getTrains(source, destination);
			}
			else
			{
				trains = traindao.getTrains();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession sess = request.getSession();
		sess.setAttribute("trainList", trains);
		RequestDispatcher rd = request.getRequestDispatcher("/findTrain.jsp");
	    rd.forward(request,response);
	}

}
