
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user.css" />
</head>
<body>
<div>
<div id="header">
Header
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
      <form action="PasswordChangeAction" method="post">
      <h2>change the password</h2>
<table>
<tr>
<td>New Password</td>
<td><input type="text" placeholder="enter here" name="newpass" id="id"></td>
</tr>

<tr>
<td>Confirm Password</td>
<td><input type="text" placeholder="enter here" name="confpass" id="name"></td>
</tr>

<tr>
<td>Current Password</td>
<td><input type="text" placeholder="enter here" name="currentpass" id="email"></td>
</tr>


</table>
<button id="btn" type="submit">Submit</button>
</form>
    </div>
</div>
<div id="footer">Footer</div>
</div>
</body>
</html>