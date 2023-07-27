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
<%out.write("<h2>Admin is:"+name +"</h2>"); %>
</div>
<div id="content">
    <div id="left">
        <ul id="menubar">
            <li><a href="">Account Manage</a></li>
            <li><a href="">Password Change</a></li>
            <li><a href="quizupload.jsp">Quiz Upload</a></li>
            <li><a href="managequiz.jsp">Manage Quiz</a></li>
            <li><a href="queryresponse.jsp">Query Response</a></li>
            <li><a href="notification.jsp">Notification</a></li>
        </ul>


    </div>
    <div id="right">
      <h1>Search the Quiz</h1>
      <form action="search.jsp" method="post">
      <table>
      <tr>
      <th>Quiz Id</th>
      <td><input type="text" name="qid" placeholder="enter the id"/></td>
      </tr>
      <tr>
      <th></th>
      <td><input type="submit" value="Search"/></td>
      </tr>
      </table>
      
      </form>
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>