package students;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class RegisterForm extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		resp.setContentType("text/html");
		
		PrintWriter out=resp.getWriter();
		//out.print("Hello");
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String contact=req.getParameter("contact");
		String password=req.getParameter("password");
		//out.print(id+name+email+contact+password);
		
		Student s=new Student();
		s.setSid(Integer.parseInt(id));
		s.setName(name);
		s.setEmail(email);
		s.setContact(contact);
		s.setPassword(password);
		s.setRole("user");
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
		SessionFactory sf=con.buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(s);
		tx.commit();
		out.print("Register successfully");
		
		resp.sendRedirect("index.html");
		
	}
	
}
