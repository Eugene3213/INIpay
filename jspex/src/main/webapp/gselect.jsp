<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./db.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//left로 Table 2개를 join한 상태
	String sql ="select a.gidx, a.gwriter, a.gsubject, a.gcount, a.gindate,";
	sql +="b.gfileurl, count(b.gidx) as ct from gboard as a ";
	sql +="left join gboard_img as b on a.gidx=b.gidx group by a.gidx,b.gidx;";
	
	PreparedStatement ps = null;
	ResultSet rs = null;	
	ArrayList<Map<String,Object>> al = null;
	
	try{
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		al = new ArrayList<>();
		
		while(rs.next()){
			Map<String,Object> mp = new HashMap<>();
			mp.put("gwriter", rs.getString("gwriter"));
			mp.put("gsubject", rs.getString("gsubject"));
			mp.put("gcount", rs.getString("gcount"));
			mp.put("gindate", rs.getString("gindate").substring(0,10));
			mp.put("gimg",rs.getString("gfileurl"));
			mp.put("rd",rs.getString("ct"));
			al.add(mp);
		};
		
	}catch(Exception e){
		e.getMessage();
	}
%>
<!-- 절대 Join 시 * 사용 안함 
	기준이 되는 테이블을 확실히 체크 해야함.
	Join 테이블 공통 필드값이 있어야 함.
	gboard -gidx,gwriter, gsubject, gcount, gindate
	gboard_img - gidx, gfileurl	-->
	
<!-- DB - INNER (join)
	 select * from adata as a join dbata as b on a.idx=b.idx -->

<!-- DB - LEFT (join): 왼쪽 테이블 기준으로 테이블을 합침
	 select * from adata as a left join bdata as b on a.idx=b.idx -->

<!-- DB - RIGHT (join): 오른쪽 테이블 기준으로 테이블을 합침 
	 select * from adata as a right join bdata as b on a.idx=b.idx -->