<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Transaction" %>
<%@page import="org.hibernate.Query" %>
<%@page import="java.util.*" %>
<%@page import="students.*"%>
<%

String name="";
String email="";
String contact="";
String password="";
String uid=request.getParameter("uid");
//out.print(uid);

try{
	Configuration con=new Configuration().configure().addAnnotatedClass(Student.class);
	SessionFactory sf=con.buildSessionFactory();
	Session sess=sf.openSession();
	Transaction tx=sess.beginTransaction();
	
	Query query=sess.createQuery("from Student where sid='"+uid+"'");
	List lst=query.list();
	Iterator itr=lst.iterator();

	while(itr.hasNext())
	{
		Student ob1=(Student)itr.next();
		name=ob1.getName();
		email=ob1.getEmail();
		contact=ob1.getContact();
		password=ob1.getPassword();
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
<title>std_mang</title>
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
      <h2>Update The Details</h2>
<form action="UpdateRecord">
<table>
<tr>
<td>Id</td>
<td><input type="text" value="<% out.print(uid); %>" name="id" id="id" readonly></td>
</tr>

<tr>
<td>Name</td>
<td><input type="text"  value="<% out.print(name); %>" name="name" id="name"></td>
</tr>
<tr>
<td>Email</td>
<td><input type="text" value="<% out.print(email); %>"  name="email" id="email"></td>
</tr>

<tr>
<td>contact</td>
<td><input type="text" value="<% out.print(contact); %>" name="contact" id="contact"></td>
</tr>

<tr>
<td>password</td>
<td><input type="password" value="<% out.print(password); %>" name="password" id="password"></td>
</tr>

</table>
<button id="btn" type="submit">Update</button>
</form>
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>