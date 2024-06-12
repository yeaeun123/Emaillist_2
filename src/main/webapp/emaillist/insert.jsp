<%@page import="himedia.vo.EmailVo"%>
<%@page import="himedia.dao.EmailListDaoOracleimpl"%>
<%@page import="himedia.dao.EmaillistDao"%>

<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//데이터베이스 접속 정보 확인
	ServletContext context = getServletContext();
	
	String dbuser = context.getInitParameter("dbuser");
	String dbpass = context.getInitParameter("dbpass");
	
	// 폼 입력 데이터 
	String firstName = request.getParameter("fn");	//이름
	String lastName = request.getParameter("ln");	// 성
	String email = request.getParameter("email");	//email
	
	EmailVo vo = new EmailVo(lastName, firstName, email); //model 2
	EmaillistDao dao = new EmailListDaoOracleimpl(dbuser, dbpass);
	
	boolean success = dao.insert(vo);
	
	/*
	String dburl = "jdbc:oracle:thin:@localhost:1522:xe";
	
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 커넥션 얻기
		Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
		// 실행 계획 
		String sql = "INSERT INTO emaillist (no, last_name, first_name, email)"+ 
				"VALUES (seq_emaillist_pk.nextval, ?, ?, ?)";
		// PreparedStatment 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		// 데이터 바인딩
		pstmt.setString(1, lastName);
		pstmt.setString(2, firstName);
		pstmt.setString(3, email);
		
		int insertedCount = pstmt.executeUpdate();
		
		if (insertedCount == 1) { // INSERT 성공
			// 다른 페이지로 리다이렉트 : 3xx
			response.sendRedirect(request.getContextPath());
		} else {
			*/
	if(success) {
		response.sendRedirect(request.getContextPath() + "/emaillist/index.jsp/");
	} else {

			%>
			<h1>Error</h1>
			<p>데이터 입력 중 오류가 발생했습니다. </p>
			<% 
			
		} 
			/*
		// 자원 정리
		pstmt.close();
		conn.close();
		
	} catch (Exception e) {
		throw e;
	}
	*/
%>
