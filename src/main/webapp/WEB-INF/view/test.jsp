<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<%
    // 데이터베이스에 연결
    String url = "jdbc:mariadb://10.1.4.122:3306/with_us?characterEncoding=utf8";
    String user = "root";
    String password = "dlsgk123";

    // 드라이버를 가져옴
    Class.forName("org.mariadb.jdbc.Driver");

    // 접속 정보를 활용해서 연결 객체를 생성
    Connection conn = DriverManager.getConnection(url, user, password);
    java.sql.PreparedStatement pstmt = null;

    ResultSet rs = null;

    // 쿼리문을 통해 데이터를 ResultSet에 담기
    String sql = "SELECT * FROM tb_txt ";

    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    // Json 형태로 변환
    JSONArray array = new JSONArray();	// [], JSON 배열 생성
    while(rs.next()) {
        JSONObject obj = new JSONObject();	// {}, JSON 객체 생성
        obj.put("txt_nm", rs.getString("txt_nm"));	// obj.put("key","value")
        obj.put("txt_cn", rs.getString("txt_cn"));
        obj.put("txt_date", rs.getString("txt_date"));
        obj.put("txt_loc_lat", rs.getString("txt_loc_lat"));
        obj.put("txt_loc_lng", rs.getString("txt_loc_lng"));
        obj.put("txt_pic", rs.getString("txt_pic"));
        obj.put("rgtr_dt", rs.getString("rgtr_dt"));

        array.add(obj);	                    // 작성한 JSON 객체를 배열에 추가
    }

    out.print(array); // 최종적으로 전달되는 데이터

    try{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}catch (Exception e){
		System.out.print("err: " + e);
	}
%>