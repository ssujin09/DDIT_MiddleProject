import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/YourServlet")
public class YourServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 클라이언트로부터 전송된 데이터 받기
        String location = request.getParameter("location");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String maxPeople = request.getParameter("maxPeople");
        String description = request.getParameter("description");
        String hidden = request.getParameter("hidden");

        // 받은 데이터를 콘솔에 출력 (테스트용)
        System.out.println("지역: " + location);
        System.out.println("날짜: " + date);
        System.out.println("시간: " + time);
        System.out.println("최대 인원: " + maxPeople);
        System.out.println("한줄 내용: " + description);
        System.out.println("히든 : "+hidden);

        // 실제로는 이 데이터를 데이터베이스에 저장하거나 다른 로직에 활용할 수 있습니다.

        // 응답으로 성공 상태 전송
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write("모임이 성공적으로 등록 되었습니다!");
        out.close();
    }
}
