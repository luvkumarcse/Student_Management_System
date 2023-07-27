package students;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class QuizResponseResult extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		PrintWriter out=resp.getWriter();
		String username=req.getParameter("username");
		String email=req.getParameter("uemail");
		String quizid=req.getParameter("quizid");
		String tmark=req.getParameter("tmark");
		String result=req.getParameter("result");
		
		QuizResponse q=new QuizResponse();
		
		q.setName(username);
		q.setEmail(email);
		q.setQid(quizid);
		q.setTotal(tmark);
		q.setObtainedno(result);
		q.setDate(null);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(QuizResponse.class);
		SessionFactory sf=con.buildSessionFactory();
		Session sess=sf.openSession();
		Transaction tx=sess.beginTransaction();
		sess.save(q);
		tx.commit();
		out.print("successfully added");
				
	}
}
