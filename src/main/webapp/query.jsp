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
      <h1>Query</h1>
      <form action="QueryResult" method="post">
      <table>
      <tr>
      <td><textarea name="query" rows="4" cols="50"></textarea></td>
      </tr>
      <input type="hidden" name="name" value="<% out.println(name); %>">
    <input type="hidden" name="email" value="<% out.println(email); %>">
       <br>
      <tr>
      <td> <input type="submit" value="Submit"/></td>
      </tr>
      
  
      </table>
      </form>
      </center>
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>