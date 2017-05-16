package repository.couple;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.user.MemberVo;


public class CoupleRepository {
	// Login Mapper의 변수 및 별칭 선언!!!!
	String namespace="coupleMapper";
	String statment="";
	
	//--------- 여기서부터는 SQL 함수~~~~~
	
	// SQL을 사용하기 전에 Factory를 써준다
	private SqlSessionFactory getSqlSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream inputStream=null;
		
		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(Exception ex){
			
		}
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		return factory;
	}
	
	// 로그인 아이디와 비밀번호가 담긴 VO를 넘겨 member가 있는지 찾아본다.
	public MemberVo selectMember(MemberVo memberVo){
		
		
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".selectMember";
			MemberVo member = sqlSess.selectOne(statement, memberVo);	// 아이디,비밀번호를 넘겨서 member가 있는지 검색!
			boolean result;		// member가 있으면 true, 없으면 false
			

			if(member == null){
//				System.out.println("로그인정보없음");
				result = false;
			}
			else{
//				System.out.println("로그인 정보 있음");
				result = true;
			}
			System.out.println("CoupleRepository)나의 아이디 : " + member.getMemberId());
			System.out.println("CoupleRepository)커플의 아이디 : " + member.getMemberCouple());

//			System.out.println("로그인 했을 때의 결과는 ?  "+result);
			return member;
		}finally{
			sqlSess.close();
		}
	}

	public MemberVo selectCouple(MemberVo member) {
		
		SqlSession sqlSess = getSqlSessionFactory().openSession();

		try{
			String statement = namespace + ".selectCouple";
			MemberVo couple = sqlSess.selectOne(statement, member);	// 아이디,비밀번호를 넘겨서 member가 있는지 검색!
			
			return couple;
		}finally{
			sqlSess.close();
		}

	}



}
