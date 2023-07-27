<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.Query" %>
<%@page import="java.util.*" %>
<%@page import="students.*"%>
    
    <%
String email=session.getAttribute("uemail").toString();
//out.write(email);
String name="";

try{
	Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
	SessionFactory sf=con.buildSessionFactory();
	Session sess=sf.openSession();
	Transaction tx=sess.beginTransaction();
	
	Query query=sess.createQuery("from Student where email='"+email+"'");
	List lst=query.list();
	Iterator itr=lst.iterator();

	while(itr.hasNext())
	{
		Student ob1=(Student)itr.next();
		name=ob1.getName();
		//out.write(name);
	
	}
	
	tx.commit();
	}
	catch(Exception e)
	{
		out.write("error");
	}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user.css" />
</head>
<body>
<div>
<div id="header">
<%out.write("<h2>username is:"+name +"</h2>"); %>
</div>
<div id="content">
    <div id="left">
        <ul id="menubar">
            <li><a href="ManageRecord">Account Manage</a></li>
            <li><a href="password_change.jsp">Password Change</a></li>
            <li><a href="userquiz.jsp">Quiz</a></li>
            <li><a href="query.jsp">Query</a></li>
            
        </ul>


    </div>
    <div id="right">
    <center>
      <h1>Quiz id</h1>
      <%
      
      Configuration con=new Configuration().configure().addAnnotatedClass(Quiz.class);
      SessionFactory sf=con.buildSessionFactory();
      Session sess=sf.openSession();
      Transaction tx=sess.beginTransaction();
      Query query= sess.createQuery("from Quiz");
    List list=query.list();
    Iterator itr=list.iterator();
    int qid=0;
    out.write("<html><body>");
    out.write("<table border='1'");
    while(itr.hasNext())
    {
    	Quiz q=(Quiz)itr.next();
    	qid=q.getQid();
    	//out.print(qid);
    	%>
    	
    	<tr>
    	<th>
    	<form action="showquiz.jsp" method="post">
    	<input type="text" name="quizid" value="<%out.print(qid); %>" readonly></br>
       <input type="submit" value="Click" />
    	</form>
    	</th>
    	</tr>
    	
    	<%
    }
    out.write("</table>");
    out.write("</body></html>");
    tx.commit();
      
      %>
      </center>
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>