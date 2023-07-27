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
            
        </ul>


    </div>
    <div id="right">
      <h1>search the data</h1>
   <%
   String qid=request.getParameter("qid");
 Configuration con=new Configuration().configure().addAnnotatedClass(Quiz.class);
 SessionFactory sf=con.buildSessionFactory();
 Session sess=sf.openSession();
 Transaction tx=sess.beginTransaction();
 Query query=sess.createQuery("from Quiz where Qid='"+qid+"'");
 List lst=query.list();
 Iterator itr=lst.iterator();
 out.write("<html><body>");
 out.write("<table border='1'");
 out.write("<tr><th>id</th><th>Qid</th><th>Question</th><th>Option1</th><th>Option2</th><th>Option3</th><th>Option4</th><th>Answer</th><th>Action</th></tr>");
 while(itr.hasNext())
 {
 	Quiz ad=(Quiz)itr.next();
 	
    
     out.write("<tr>");
     out.write("<td>"+ad.getId()+ "</td>");
     out.write("<td>"+ad.getQid()+ "</td>");
     out.write("<td>"+ad.getQuestion()+ "</td>");
     out.write("<td>"+ad.getOption1()+ "</td>");
     out.write("<td>"+ad.getOption2()+ "</td>");
     out.write("<td>"+ad.getOption3()+ "</td>");
     out.write("<td>"+ad.getOption4()+ "</td>");
     out.write("<td>"+ad.getAnswer()+ "</td>");
   
     %>
     <td>
     <form action="deletequiz.jsp" method="post">
     <input type="hidden" value="<%out.print(ad.getId()); %>" name="did" />
     <input type="submit" value="DELETE" />
     </form>
     
      <form action="updatequiz.jsp" method="post">
     <input type="hidden" value="<% out.print(ad.getId()); %>" name="uid" />
     <input type="submit" value="EDIT" />
     
     </form>
     </td>
     <% 
     out.write("</tr>");
    
 	
 }
 out.write("</table>");
 out.write("</body></html>");
 tx.commit();
 
 
 %>
     
      
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>