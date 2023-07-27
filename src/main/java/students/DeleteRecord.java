package students;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class DeleteRecord extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		PrintWriter out=resp.getWriter();
		//out.print("Hello");
		String id=req.getParameter("id");
		Student s=new Student();
		s.setSid(Integer.parseInt(id));
		
		try{
			Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
			SessionFactory sf=con.buildSessionFactory();
			Session sess=sf.openSession();
			Transaction tx=sess.beginTransaction();
			sess.delete(s);
			tx.commit();
			resp.sendRedirect("user.html");
			}
			catch(Exception e)
			{
				out.write("error");
			}
	}
	

}
