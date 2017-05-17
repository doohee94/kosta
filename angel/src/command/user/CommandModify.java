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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import command.basic.Command;
import command.basic.CommandException;
import model.user.MemberVo;
import service.login.LoginService;

// 회원 정보를 수정하는 명령을 주자!!!!!!!!!!!!!!
public class CommandModify implements Command {
	
	String next;
	public CommandModify(String _next){
		System.out.println("commandSignUp을 탄당....ㅎㅎㅎ");
		next=_next;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws CommandException {
		
		// DB에 입력할 memberVO 객체를 생성한다.
		MemberVo inputMember = new MemberVo();

		// enctype="multipart/form-data" 으로 선언하고 submit한 데이터는
		// request가 아닌 MultipartRequest 객체로 불러와야 한다.
		
		// 파일이 저장될 주소를 선언.
		String saveDirectory="C:\\Users\\kosta\\git\\angel\\angel\\WebContent\\profile\\";
		
		try {
			MultipartRequest mult = new MultipartRequest(request, saveDirectory, 1024*1024*15, "euc-kr", new DefaultFileRenamePolicy());
			
			String id = mult.getParameter("id");
			String pw = mult.getParameter("pw");
			String pwCheck = mult.getParameter("pwCheck");
			String name = mult.getParameter("name");
			String gender = mult.getParameter("gender");
			String tel = mult.getParameter("tel");
			String birth = mult.getParameter("birth");
			// 전송받은 데이터가 파일일 경우 getOriginalFileName 으로 파일 이름을 받는다.
			String photo = mult.getOriginalFileName("photo");
			// 업로드한 파일의 전체 경로를 DB에 저장하기 위함.. (사용하기 쉽게 하기 위해 잘라서 넣는다. 나중에 가져오기 쉽게할려고!!!!)
			String path = "/angel/profile/"+photo;
			
			// 잘 가져오는지 test 해보기위함.. (파라미터를.. 아주 힘들었음)
			System.out.println("id는   "+id);
			System.out.println("pw는   "+pw);
			System.out.println("pwCheck는   "+pwCheck);
			System.out.println("name는   "+name);
			System.out.println("gender는   "+gender);
			System.out.println("tel는   "+tel);
			System.out.println("birth는   "+birth);
			System.out.println("photo이름은   "+photo);
			System.out.println("photo저장경로는  "+path);
			
			// 잘 가져왔으니 inputMember객체에 대입해준다.... 
			inputMember.setMemberId(id);
			inputMember.setMemberPw(pw);
			inputMember.setMemberName(name);
			inputMember.setMemberGender(gender);
			inputMember.setMemberTel(tel);
			inputMember.setMemberBirth(birth);
			inputMember.setPhotoName(photo);
			inputMember.setPhotoRealpath(path);
			
			// DB에 대입!!!!!!
			LoginService.getInstance().inputMember(inputMember);
			
			request.setAttribute("id", id);
			request.setAttribute("path", path);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
return next;
	}
}

