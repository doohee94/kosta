package repository.Login;

import java.io.InputStream;

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
	public int selectMember(MemberVo memberVo){
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".selectMember";
			int result = sqlSess.selectOne(statement, memberVo);
			return result;
		}finally{
			sqlSess.close();
		}
	}

}
