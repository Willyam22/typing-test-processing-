import java.sql.*;
import java.sql.Statement;

public class db{
  private String className = "com.mysql.cj.jdbc.Driver";
  private String dbName = "jdbc:mysql://localhost:3306/kata";
  private String userName = "root";
  private String password = "";
  
  private ArrayList<String> kata = new ArrayList<String>();
  
  
  
  public db(){
    try{
      Class.forName(className);
      Connection conn = (Connection) DriverManager.getConnection(dbName,userName,password);
      
      String sql = "SELECT katadasar FROM tb_katadasar";
      PreparedStatement ptst = conn.prepareStatement(sql);
      ResultSet rs = ptst.executeQuery();
      
      while(rs.next()){
        kata.add(rs.getString("katadasar"));
      }

    }catch(Exception e){
      println(e);
    }
    
  }
  
  public ArrayList<String> getKata(){
    return kata;
  }
  
  
  
  
  
  
  
  
}
