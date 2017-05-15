package command.user;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

// 회원가입하는 Command
public class CommandSignUp implements Command {
	
	String next;
	public CommandSignUp(String _next){
		System.out.println("commandSignUp을 탄당....ㅎㅎㅎ");
		next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		// multi-path는 getparameter를 사용하지 못한다. getpart를 사용해야 함... 무조건.
		
		MemberVo memberVo = new MemberVo();

//		memberVo.setMemberId(request.getParameter("id"));
//		memberVo.setMemberPw(request.getParameter("pw"));
//		memberVo.setMemberName(request.getParameter("name"));
//		memberVo.setMemberGender(request.getParameter("gender"));
//		memberVo.setMemberTel(request.getParameter("tel"));
//		memberVo.setMemberBirth(request.getParameter("birth"));



		
		System.out.println("알라리알라리알라리");


		try{

			
		
			String inputId = request.getParameter("id");
			Part pwPart = request.getPart("pw");

			
			System.out.println("-----readParameterValue는는는id : " + inputId);
			System.out.println("-----readParameterValue는는는pw: " + pwPart);

//			String id = readParameterValue(idPart);
//			System.out.println("가져온 아이디는??????   " + id);
			
			
		// 회원가입시, photo를 입력하는 ..... 후아.... 어렵다!!!!!!
//		System.out.println("photo 입력 시작");
//		Part file = request.getPart("photo");
//		String fileName =getFileName(file);
//		System.out.println("파일 이름은???  "+fileName);
//		String realPath = FileSaveHelper.save("C:\\Users\\kosta\\workspace(Web)\\JSP\\WebContent\\fileupload\\",
//				file.getInputStream());
//		memberVo.setPhotoRealpath(realPath);
//		System.out.println("진짜 경로는???  "+realPath);
		
//		int signup = LoginService.getInstance().inputMember(memberVo);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return next;
	}

	
	
	
	
	private String getFileName(Part part) throws UnsupportedEncodingException {
//		System.out.println("part의 헤더가져오기    "+part.getHeader("Content-Disposition"));
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
	
	private String readParameterValue(Part part) throws IOException {
		System.out.println("-----타나1");
		InputStreamReader reader = new InputStreamReader(part.getInputStream(),"euc-kr");
		System.out.println("-----타나2");
		char[] data = new char[512];
		int len = -1;
		StringBuilder builder = new StringBuilder();
		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}
}
