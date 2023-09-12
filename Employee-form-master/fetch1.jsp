<%@ page import="java.sql.*" %>
<%

   try {
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?user=root&password=password&useUnicode=true&characterEncoding=UTF-8");
      
      // Retrieving data from the database
      Statement stmt = conn.createStatement();
      String sql = "SELECT * FROM details";
      ResultSet rs = stmt.executeQuery(sql);
      
      // Displaying data in a table
      out.println("<table>");
      out.println("<tr><th>EMP NAME</th><th>EMAIL</th><th>PHONE</th><th>GENDER</th><th>DOB</th><th>QUALIFICATION</th><th>EXPERIENCE PAST</th><th>JOINING YEAR</th><th>EXPERIENCE</th>");
      while(rs.next()) {
        int y = rs.getInt("expcur");
        int ans = 2023 - y;
         out.println("<tr>");
         out.println("<td>" + rs.getString("empname") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("dob") + "</td>");
         out.println("<td>" + rs.getString("mobile") + "</td>");
         out.println("<td>" + rs.getString("gender") + "</td>");
         out.println("<td>" + rs.getString("qual") + "</td>");
         out.println("<td>" + rs.getString("exppast") + "</td>");
         out.println("<td>" + rs.getInt("expcur") + "</td>");
         out.println("<td>"+ans+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");
   } catch(Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if(rs!=null) rs.close();
         if(stmt!=null) stmt.close();
         if(conn!=null) conn.close();
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
%>