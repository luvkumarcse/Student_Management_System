package students;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class PasswordChangeAction extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession();
		String newpass=req.getParameter("newpass");
		String confpass=req.getParameter("confpass");
		String currentpass=req.getParameter("currentpass");
		
		//out.print(newpass+confpass+currentpass);
		
		if(newpass.equals(confpass))
		{
			String email=session.getAttribute("uemail").toString();
			out.write(email);
			
			try{
				Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
				SessionFactory sf=con.buildSessionFactory();
				Session sess=sf.openSession();
				Transaction tx=sess.beginTransaction();
				
				Query query=sess.createQuery("from Student where email='"+email+"'and password='"+currentpass+"'");
				List lst=query.list();
				Iterator itr=lst.iterator();
				int id = 0;
				String name="";
				String email1="";
				String contact="";
				String password="";
				String role="";
				
				
				while(itr.hasNext())
				{
					Student ob1=(Student)itr.next();
					id=ob1.getSid();
					name=ob1.getName();
					email1=ob1.getEmail();
					contact=ob1.getContact();
					password=ob1.getPassword();
					role=ob1.getRole();
					
				}
				if(newpass.equals(confpass))
				{
					Student s1=new Student();
			
					s1.setSid(id);
					s1.setName(name);
					s1.setEmail(email1);
					s1.setContact(contact);
					s1.setPassword(confpass);
					s1.setRole(role);
					Configuration conn=new Configuration().configure().addAnnotatedClass(Student.class);
					SessionFactory sf1=conn.buildSessionFactory();
					Session session1=sf1.openSession();
					Transaction tx1=session1.beginTransaction();
					session1.update(s1);
					tx1.commit();
					out.print("password change successfully");
					resp.sendRedirect("user.jsp");
					
				}
				else {
					out.print("sorry");
				}
				
				tx.commit();
				}
				catch(Exception e)
				{
					out.write("error");
				}
				
		}
		else
		{
			out.print("sorry please put the correct password");
		}
		
	}
	
	
}
