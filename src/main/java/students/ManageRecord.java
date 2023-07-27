package students;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ManageRecord extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
		PrintWriter out=resp.getWriter();
		
		out.write("<html>");
		out.write("<head>");
		out.write("<title>KVCH Noida</title>");
		out.write("<link rel=\"stylesheet\" href=\"css/user.css\" />");
		out.write("</head>");
		out.write("<body>");
		out.write("<div>");
		out.write("<div id=\"header\">Header</div>");
		out.write("<div id=\"content\">");
		    out.write("<div id=\"left\">");
		       out.write("<ul id=\"menubar\">");
		           out.write("<li><a href=\"ManageRecord\">Account Manage</a></li>");
		           out.write("<li><a href=\"password_change.jsp\">Password Change</a></li>");
		            out.write("<li><a href=\"userquiz.jsp\">Quiz</a></li>");
		            out.write("<li><a href=\"\">Query</a></li>");
		            
		       out.write(" </ul>");


		  out.write(" </div>"); 
		    out.write("<div id=\"right\">");
		    Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
			 SessionFactory sf=con.buildSessionFactory();
			 Session sess=sf.openSession();
			 Transaction tx=sess.beginTransaction();
			 Query query=sess.createQuery("from Student");
			 List lst=query.list();
			 Iterator itr=lst.iterator();
			 out.write("<html><body>");
			 out.write("<table border='1'");
			 out.write("<tr><th>Sid</th><th>Name</th><th>Email</th><th>Contact</th><th>Password</th><th>Action</th></tr>");
			 while(itr.hasNext())
			 {
			 	Student s=(Student)itr.next();
			 	
			    
			     out.write("<tr>");
			     out.write("<td>"+s.getSid()+ "</td>");
			     out.write("<td>"+s.getName()+ "</td>");
			     out.write("<td>"+s.getEmail()+ "</td>");
			     out.write("<td>"+s.getContact()+ "</td>");
			     out.write("<td>"+s.getPassword()+ "</td>");
			     
			     int lid=s.getSid();
			     out.write("<td>");
			     out.write("<form action=\"delete.html\" method=\"post\">");
			     out.write("<input type=\"hidden\" value=\" out.print(s.getSid());\" name=\"Sid\" />");
			     out.write("<input type=\"submit\" value=\"DELETE\" />");
			     out.write("</form>");
			     out.write("<form action=\"update.jsp\" method=\"post\">");
			     out.write("<input type='hidden' value="+lid +" name=uid />");
			     out.write("<input type=\"submit\" value=\"Edit\" />");
			     out.write("</form>");
			     out.write("</td>");
			     out.write("</tr>");
			     
			 
			 }
			 out.write("</table>");
		   out.write(" </div>");
		out.write("</div>");
		out.write("<div id=\"footer\">Footer</div>");
		out.write("</div>");
		out.write("</body>");
		out.write("</html>");
}
}
