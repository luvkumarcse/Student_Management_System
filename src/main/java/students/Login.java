package students;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Login extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		//out.print("hello");
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		//out.print(email+password);
		Student s=new Student();
		s.setEmail(email);
		s.setPassword(password);
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
		SessionFactory sf=con.buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		Query query= session.createQuery("from Student where email='"+email+"' and password='"+password+"'");
		List lst=query.list();
		Iterator itr=lst.iterator();
		int c=0;
		String role="";
		while(itr.hasNext())
		{
			Student ob=(Student)itr.next();
			//out.print(ob.getRole());
			role=ob.getRole();
			c++;
		}
		if(c==1)
		{
			//out.write("login");
			HttpSession sess=req.getSession();
			sess.setAttribute("uemail", email);
			  
			if(role.equals("user"))
			{
				resp.sendRedirect("user.jsp");	
			}
			else
			{
				resp.sendRedirect("admin.jsp");	
			}
	}
	else
	{
		out.write("Sorry... Wrong Email or Password");
	}
		}
	}
	

