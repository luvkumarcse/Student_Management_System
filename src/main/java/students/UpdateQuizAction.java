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


public class UpdateQuizAction extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		PrintWriter out=resp.getWriter();
		//out.print("hello");
		String  id=req.getParameter("id");
		String qid=req.getParameter("qid");
		String question=req.getParameter("question");
		String option1=req.getParameter("optiona");
		String option2=req.getParameter("optionb");
		String option3=req.getParameter("optionc");
		String option4=req.getParameter("optiond");
		String answer=req.getParameter("answer");
		//out.print(id+qid+question+option1+option2+option3+option4+answer);
		
		Quiz ob=new Quiz();
		ob.setId(Integer.parseInt(id));
		ob.setQid(Integer.parseInt(qid));
		ob.setQuestion(question);
		ob.setOption1(option1);
		ob.setOption2(option2);
		ob.setOption3(option3);
		ob.setOption4(option4);
		ob.setAnswer(answer);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Quiz.class);
		SessionFactory sf=con.buildSessionFactory();
		Session sess=sf.openSession();
		Transaction tx=sess.beginTransaction();
		sess.update(ob);
		tx.commit();
		out.print("updated");
		resp.sendRedirect("admin.jsp");
	}
}
