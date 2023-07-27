package students;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class QueryResponseAction extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse resp)throws IOException
	{
	PrintWriter out=resp.getWriter();
	String qid=req.getParameter("qid");
	String respp=req.getParameter("respp");
	out.println(qid+respp);
	
	Configuration con1=new Configuration().configure().addAnnotatedClass(Queries.class);
	SessionFactory sf1=con1.buildSessionFactory();
	Session sess1=sf1.openSession();
	Transaction tx1=sess1.beginTransaction();
	Query q1=sess1.createQuery("from Queries where id='"+qid+"'");
	List list1=q1.list();
	Iterator itr= list1.iterator();
	String name="";
	String email="";
	String query="";
	while(itr.hasNext())
	{
		Queries qq=(Queries) itr.next();
		name=qq.getName();
		email=qq.getEmail();
		query=qq.getQuery();
	}
	tx1.commit();
	
		
		Queries q=new Queries();
		q.setId(Integer.parseInt(qid));
		q.setName(name);
		q.setEmail(email);
		q.setQuery(query);
		q.setResponse(respp);
		q.setStatus("Done");
		
		Configuration con=new Configuration().configure().addAnnotatedClass(Queries.class);
		SessionFactory sf=con.buildSessionFactory();
		Session sess=sf.openSession();
		Transaction tx=sess.beginTransaction();
		sess.update(q);
		tx.commit();
		out.print("successfully");
	
	}

}
