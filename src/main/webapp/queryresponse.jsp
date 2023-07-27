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
      <h1>Query response</h1>
      <%
      Configuration con1=new Configuration().configure().addAnnotatedClass(Queries.class);
      SessionFactory sf1=con1.buildSessionFactory();
      Session sess1=sf1.openSession();
      Transaction tx1=sess1.beginTransaction();
      Query query1=sess1.createQuery("from Queries");
      List lst1=query1.list();
      Iterator itr1=lst1.iterator();
      out.write("<html><body>");
      out.write("<table border='1'");
      out.write("<tr><th>id</th><th>Name</th><th>Email</th><th>Query</th><th>response</th><th>status</th><th>Action</th></tr>");
      String resp="";
      int t=1;
      while(itr1.hasNext())
      {
      	Queries ad=(Queries)itr1.next();
      resp=	ad.getResponse();
      	
          out.write("<tr>");
          out.write("<td>"+ad.getId()+ "</td>");
          out.write("<td>"+ad.getName()+ "</td>");
          out.write("<td>"+ad.getEmail()+ "</td>");
          out.write("<td>"+ad.getQuery()+ "</td>");
          out.write("<td><input type='text' id='resp"+t+"' ></td>");
          out.write("<td>"+ad.getStatus()+ "</td>");
         
          %>
          <td>
          
          <form>
         
          <input type="hidden" id=qid<% out.println(t);%> value="<% out.println(ad.getId()); %>">
         
          <input type="button" onclick='msg(<% out.println(t); %>)' value="Click">
          </form>
          </td>
          <%
          t++;
          out.write("</tr>");
         
      	
      }
      out.write("</table>");
      out.write("</body></html>");
      tx1.commit();
      
      
      %>
          
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>
<script src="jquery.js"></script>
<script>
function msg(t)
{
	var qid=$("#qid"+t).val();
	var respp=$("#resp"+t).val();
	
	alert(qid+respp);
	window.location.replace("QueryResponseAction?qid="+qid+"&&respp="+respp);
	//$.post("QueryResponseAction",{qid:qid, respp:respp},function(data){
		//alert(data);
		
	//});
}


</script>