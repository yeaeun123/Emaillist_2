<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String no = request.getParameter("no");

// DB 접속 정보를 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
String dburl = "jdbc:oracle:thin:@localhost:1522:xe";

try {
    // 드라이버 로드
    Class.forName("oracle.jdbc.driver.OracleDriver");
    // 데이터베이스 연결
    try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
         PreparedStatement pstmt = conn.prepareStatement("DELETE FROM emaillist WHERE no = ?")) {

        // no 값 바인딩
        pstmt.setString(1, no);

        int deletedCount = pstmt.executeUpdate();
        if (deletedCount == 1) {
            // 삭제 성공 시 메인 페이지로 리다이렉트
            response.sendRedirect("index.jsp");
        } else {
            // 삭제 실패 시 에러 메시지 출력
            out.println("<script>alert('삭제 실패. 해당 레코드를 찾을 수 없습니다.'); history.back();</script>");
        }
    }
} catch (ClassNotFoundException e) {
    throw new ClassNotFoundException("드라이버를 찾을 수 없습니다.", e);
} catch (SQLException e) {
    e.printStackTrace();
    out.println("<script>alert('데이터베이스 오류가 발생했습니다.'); history.back();</script>");
}
%>
