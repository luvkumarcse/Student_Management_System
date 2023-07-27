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
      <h1>show quiz</h1>
      <input type="hidden" id="sess" value="<% out.println(email);  %>" />
      <input type="hidden" id="username" value="<% out.println(name);  %>" />
     
      <%
      String quizid=request.getParameter("quizid");
      //out.print(quizid);
      Configuration con=new Configuration().configure().addAnnotatedClass(Quiz.class);
      SessionFactory sf=con.buildSessionFactory();
      Session sess=sf.openSession();
      Transaction tx=sess.beginTransaction();
     Query query= sess.createQuery("from Quiz where Qid='"+quizid+"'");
    List list=  query.list();
    Iterator itr=list.iterator();
    String question="";
    String option1="";
    String option2="";
    String option3="";
    String option4="";
    String answer="";
    out.write("<html><body>");
    out.write("<table border='1'");
    out.write("<tr><th>Question</th><th>Option1</th><th>Option2</th><th>Option3</th><th>Option4</th><th colspan=2>Answer</th></tr>");
    int t=1;
    while(itr.hasNext())
    {
    	Quiz q=(Quiz)itr.next();
    	question=q.getQuestion();
    	option1=q.getOption1();
    	option2=q.getOption2();
    	option3=q.getOption3();
    	option4=q.getOption4();
    	answer=q.getAnswer();
    	out.print("<td>"+question+"</td>");
    	out.print("<td>"+option1+"</td>");
    	out.print("<td>"+option2+"</td>");
    	out.print("<td>"+option3+"</td>");
    	out.print("<td>"+option4+"</td>");
    	out.print("<td><input type='hidden' id='ans"+t+"' value='"+answer+"'  />");
    	out.print("<input type='text'   id='"+t+"'    /></td>");
    	out.print("<td><input type='button' id='btn"+t+"'  onclick=msg("+t+")  value='CLICK'   /></td>");
    	t++;
    	 %>
    	 
   <% 
     out.write("</tr>");
    
 	
 }
 out.write("</table>");
 out.write("</body></html>");
 tx.commit();
 
 
 %>
 <input type="hidden" id="tmark" value="<% out.println(t); %>">
   <input type="hidden" id=quizid value="<% out.println(quizid);  %>" /> 	 
 <input type="button" id="resultbtn" value="SUBMIT"> 
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>

<script src="jquery.js"></script>
<script>
var result=0;
function msg(t)
{
//alert(t);
var estop=$("#"+t).val();
//alert(estop);
var answer=$("#ans"+t).val();
//alert(answer);
if(answer==estop)
	result++;
	
$("#btn"+t).hide();
$("#"+t).hide();
}
$("document").ready(function(){

	$("#resultbtn").click(function(){
		var uemail=$("#sess").val();
		var tmark=$("#tmark").val()-1;
		var username=$("#username").val();
		var quizid=$("#quizid").val();	
//alert(uemail+tmark+username+result);
$.post("QuizResponseResult",{username:username, uemail:uemail,quizid:quizid, tmark:tmark,result:result},function(data){
	alert(data);
	
});
		});
});
</script>