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

public class QueryResult extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		PrintWriter out=resp.getWriter();
		//out.print("Hello");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String query=req.getParameter("query");
		
		Queries q=new Queries();
		q.setName(name);
		q.setEmail(email);
		q.setQuery(query);
		q.setResponse("");
		q.setStatus("pending");
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Queries.class);
		SessionFactory sf=con.buildSessionFactory();
		Session sess=sf.openSession();
		Transaction tx=sess.beginTransaction();
		sess.save(q);
		tx.commit();
		out.print("success");
		resp.sendRedirect("user.jsp");
	}

}
