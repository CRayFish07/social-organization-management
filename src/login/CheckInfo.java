package login;
import com.opensymphony.xwork2.*;

import java.sql.*;
import java.util.*;

import jq.User;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;
public class CheckInfo extends ActionSupport{
	String myjson;
	private Map<String,Object> dataMap;
	
	@Override public String execute(){
		//处理接收的myjson变量
		System.out.println(myjson);
		AdminBean admin = (AdminBean) getJsonObj(myjson, AdminBean.class);
		System.out.println(admin.username + ", " + admin.password);
		
		AdminBean adminJson = new AdminBean();
		//连接数据库
		try{
			 String URL = "jdbc:mysql://localhost/community?autoReconnect=true&useSSL=false";
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection con = DriverManager.getConnection(URL, "root", "qian940712");
	         String sql = "SELECT * FROM user";
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery(sql);
	         
	         while (rs.next()){
	        	 if((admin.username).equals(rs.getString(1))){
	        		 if((admin.password).equals(rs.getString(2))){
	        			 adminJson.setIsTrue(true);
	        		 }else{
	        			 adminJson.setIsTrue(false);
	        		 }
	        	 }else{
	        		 adminJson.setIsTrue(false);
	        	 }
	         }
		}catch(Exception e){
			System.out.print(e);
		}
		//封装返回的json对象(数组)
		dataMap = new HashMap<String, Object>();
        dataMap.put("admin", adminJson);
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
