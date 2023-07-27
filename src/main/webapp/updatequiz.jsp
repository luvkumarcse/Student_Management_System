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
<%
int qid=0;
String question="";
String option1="";
String option2="";
String option3="";
String option4="";
String answer="";

String uid=request.getParameter("uid");
//out.print(uid);

try{
	Configuration con=new Configuration().configure().addAnnotatedClass(Quiz.class);
	SessionFactory sf=con.buildSessionFactory();
	Session sess=sf.openSession();
	Transaction tx=sess.beginTransaction();
	
	Query query=sess.createQuery("from Quiz where id='"+uid+"'");
	List lst=query.list();
	Iterator itr=lst.iterator();

	while(itr.hasNext())
	{
		Quiz ob1=(Quiz)itr.next();
		qid=ob1.getQid();
		question=ob1.getQuestion();
		option1=ob1.getOption1();
		option2=ob1.getOption2();
		option3=ob1.getOption3();
		option4=ob1.getOption4();
		answer=ob1.getAnswer();
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
    <center>
      <h1>update the quiz</h1>
      <form action="UpdateQuizAction" method="post">
      <table border="1">
      <tr>
      <th>Id</th>
       <td><input type="text" value="<% out.print(uid); %>" name="id" readonly> </td>  
      </tr>
      <tr>
      <th>QId</th>
       <td><input type="text" value="<% out.print(qid); %>" name="qid"></td>  
      </tr>
      <tr>
      <th>Question</th>
       <td><input type="text" value="<% out.print(question); %>" name="question"></td>  
      </tr>
      <tr>
      <th>Option A</th>
       <td><input type="text" value="<% out.print(option1); %>" name="optiona"></td>  
      </tr>
      <tr>
      <th>Option B</th>
       <td><input type="text" value="<% out.print(option2); %>" name="optionb"></td>  
      </tr>
      <tr>
      <th>Option C</th>
       <td><input type="text" value="<% out.print(option3); %>" name="optionc"></td>  
      </tr>
      <tr>
      <th>Option D</th>
       <td><input type="text" value="<% out.print(option4); %>" name="optiond"></td>  
      </tr>
      <tr>
      <th>Answer</th>
       <td><input type="text" value="<% out.print(answer); %>" name="answer"></td>  
      </tr>
      <tr>
      <th></th>
       <td><input type="submit" value="Update" name="answer"></td>  
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