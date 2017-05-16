package repository.Login;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.user.MemberVo;


public class LoginRepository {
	// Login Mapper의 변수 및 별칭 선언!!!!
	String namespace="memberMapper";
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
		
		System.out.println("로그인 할 때의 아이디 : " + memberVo.getMemberId());
		System.out.println("로그인 할 때의 비밀번호 : " + memberVo.getMemberPw());
		
		
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
//			System.out.println("로그인 했을 때의 결과는 ?  "+result);
			return member;
		}finally{
			sqlSess.close();
		}
	}

	// 회원가입 화면에서 새로운 고객의 정보를 DB에 입력한다.
	public int imputMember(MemberVo memberVo) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".inputMember";
			int result = sqlSess.insert(statement, memberVo);
			if(result > 0){
				sqlSess.commit();
			}else{
				sqlSess.rollback();
			}
		}finally{
			sqlSess.close();
		}
		return 0;
	}

	
	public String idcheck(String inputId) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try{
			
			String statement = namespace + ".idCheck";
			String result;
			
			HashMap map = new HashMap();
			map.put("inputId", inputId);
			
			List<MemberVo> member= sqlSess.selectList(statement, map);	// 아이디를 넘겨서 이미있는 아이디인지 검색!
			if(member.size()==0){
				System.out.println("없는 아이디, 사용가능");
				result = "true";
			}
			else{
				System.out.println("있는 아이디, 사용불가능");
				result = "false";
			}
			return result;
			
		}finally{
			sqlSess.close();
		}
	}
	
	
	//커플 아이디 쳌
	public String selectCouple(String cid){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		
		try{
			System.out.println("레포 여기탐?????");
			String result = "false";
			String statement = namespace + ".coupleChek";
			HashMap map = new HashMap();
			map.put("cid", cid);
			List<MemberVo> member= sqlSess.selectList(statement, map);	// 아이디를 넘겨서 이미있는 아이디인지 검색!
			
			if(member.size()>0){
				result = "true";
				return result;
			}else{
				return result;
			}	
		}finally {
			sqlSess.close();
		}	
	}//커플 아이디 쳌
	
	public int makeCouple(String id, String cid, String date){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		System.out.println("왜 안타니!!!!!!!!!여기 타니?????????????????");
		String statement1 = namespace + ".coupleMake_ME";
		String statement2 = namespace + ".coupleMake_Lover";
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("cid", cid);
		map.put("date", date);
		try{
			
			int update_me = sqlSess.update(statement1,map);
			if(update_me > 0){
				sqlSess.commit();
			}else{
				sqlSess.rollback();
			}
			
			int update_lover = sqlSess.update(statement2,map);
			
			if(update_lover > 0){
				sqlSess.commit();
			}else{
				sqlSess.rollback();
			}
			
		}finally {
			sqlSess.close();
		}
		return 0; 
	}
	
	
	
	
	
	

}
