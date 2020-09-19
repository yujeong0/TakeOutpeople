package pknu.it;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class checkid { 
   static public int check(String name) {
      int rst = 0;
      Connection conn = null;
      PreparedStatement pst = null;
      ResultSet rs = null;
      try {
      conn = DBConnection.getConnection();

      String sqlStr = "select * from member where mem_name=?";
      pst = conn.prepareStatement(sqlStr);
      pst.setString(1, name);
      rs  = pst.executeQuery();

          if(rs.next()){ 
            rst = 1;
            }      
         rs.close();
         pst.close();
         conn.close();
      }catch (Exception e) {
         e.printStackTrace();
      }
         return rst;
   }
}