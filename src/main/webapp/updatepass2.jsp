<%@ include file ="dbconnect.jsp" %>
<%

String npass=request.getParameter("t1");
String mob;
mob=(String) session.getAttribute("smob");
String query ="Update student set password=? where mobile=?";
try
{
            PreparedStatement pstat= conn.prepareStatement(query);
            pstat.setString(1,name);
            pstat.setString(2,mobile);
            pstat.setString(3, String.valueOf(rollno));
            int row= pstat.executeUpdate();
            if(row>0)
                System.out.println("Data updated Succesfully");
            else{
                System.out.println("Data not updated");
            }

        }
catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
%>