package managementSystem;
import com.opensymphony.xwork2.*;

import java.sql.*;
import java.util.*;

import managementSystem.Member;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;
public class GetMember extends ActionSupport{
	String myjson;
	private Map<String,Object> dataMap;
	
	@Override public String execute(){
		//处理接收的myjson变量
		Member member = (Member) getJsonObj(myjson, Member.class);
		//封装返回的json对象(数组)
		dataMap = new HashMap<String, Object>();
		//连接数据库
		try{
			 String URL = "jdbc:mysql://localhost/community?autoReconnect=true&useSSL=false";
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection con = DriverManager.getConnection(URL, "root", "qian940712");
	         //String sql = "insert into members values('" + member.name + "','" + member.sex + "','" + member.tel + "','" + member.academyName + "','" + member.joinTime + "');";
	         String sql = "";
	         if((member.flags).equals("all")){
	        	 sql = "select * from members";
	         }else if((member.flags).equals("sex")){
	        	 sql = "select * from members where sex='" + member.sex +"'";
	         }else if((member.flags).equals("academyName")){
	        	 sql = "select * from members where academy='" + member.academyName +"'";
	         }else if((member.flags).equals("name")){
	        	 sql = "select * from members where name='" + member.name +"'";
	         }else if((member.flags).equals("correctOrder")){
	        	 sql = "select * from members order by jointime asc";
	         }else if((member.flags).equals("reverseOrder")){
	        	 sql = "select * from members order by jointime desc";
	         }else{
	        	 System.out.println("未识别的flags");
	         }
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery(sql);
	         int i = 0;
	         while(rs.next()){
	        	 //System.out.println(rs.getString(1));
	        	 Member memberJson = new Member();
	        	 memberJson.setName(rs.getString(1));
	        	 memberJson.setSex(rs.getString(2));
	        	 memberJson.setTel(rs.getString(3));
	        	 memberJson.setAcademyName(rs.getString(4));
	        	 memberJson.setJoinTime(rs.getString(5));
	        	 dataMap.put(""+ i +"", memberJson);
	        	 i++;
	         }
	         //System.out.println(dataMap);
	         //stmt.executeUpdate(sql);
	         //memberJson.setIsOk(true);
		}catch(Exception e){
			System.out.print(e);
		}
		
		return SUCCESS;
	}

	//把json字符串对象转换成java对象
	public static Object getJsonObj(String jsonString, Class clazz) {
		JSONObject jsonObject = null;
		try {
			jsonObject = JSONObject.fromObject(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSONObject.toBean(jsonObject, clazz);
	}
	
	@JSON(deserialize=true)
	public String getMyjson() {
		return myjson;
	}

	public void setMyjson(String myjson) {
		this.myjson = myjson;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
}