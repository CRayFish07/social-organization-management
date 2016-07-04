package managementSystem;
import com.opensymphony.xwork2.*;

import java.sql.*;
import java.util.*;

import managementSystem.Member;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;
public class UpdateMember extends ActionSupport{
	String myjson;
	private Map<String,Object> dataMap;
	
	@Override public String execute(){
		//������յ�myjson����
		Member member = (Member) getJsonObj(myjson, Member.class);
		//��װ���ص�json����(����)
		dataMap = new HashMap<String, Object>();
		//�������ݿ�
		try{
			 String URL = "jdbc:mysql://localhost/community?autoReconnect=true&useSSL=false";
	         Class.forName("com.mysql.jdbc.Driver");
	         Connection con = DriverManager.getConnection(URL, "root", "qian940712");
	         //String sql = "insert into members values('" + member.name + "','" + member.sex + "','" + member.tel + "','" + member.academyName + "','" + member.joinTime + "');";
	         String sql = "update members set sex=?, tel=?, academy=?, jointime=? where name='" + member.name +"'";
	         PreparedStatement pst = con.prepareStatement(sql);
	         pst.setString(1, member.sex);
	         pst.setString(2, member.tel);
	         pst.setString(3, member.academyName);
	         pst.setString(4, member.joinTime);
	         pst.executeUpdate();
		}catch(Exception e){
			System.out.print(e);
		}
		
		return SUCCESS;
	}

	//��json�ַ�������ת����java����
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