<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COMPTECH Programming Contest</title>
    </head>
    <body style="background: darkgreen">
       <%
           try
           {
           
                String username=request.getParameter("Username");
                String roll=request.getParameter("Pass");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/chat","root","root");
                PreparedStatement ps=conn.prepareStatement("select email,roll from contest where roll='"+roll+"'");
              ResultSet rs=ps.executeQuery();
              if(rs.next())
              {
                  
                  String email=rs.getString(1);
                   if(email.equals(username))
                    response.setHeader("refresh","0;url=question.html");
                   else
                     throw new Exception("I P");
              }
              else
              {
                 response.setHeader("refresh","0;url=index1.html");
              }
           }
           catch(Exception e)
           {
               out.print(e.getMessage());
               response.setHeader("refresh","0;url=index1.html");
           }
       %> 
    </body>
</html>
