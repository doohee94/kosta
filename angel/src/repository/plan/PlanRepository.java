package repository.plan;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.plan.PlanVo;

public class PlanRepository {
	
	private String namespace = "mapper.plan.PlanMapper";
	
	
	private SqlSessionFactory getSqlSesstionFactory(){
		String resource = "mybatis-config.xml";
		InputStream inputStream=null;
		
		try{
			inputStream = Resources.getResourceAsStream(resource);
			
		}catch (Exception ec) {
			
		}
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		return factory; //설정파일을 
	}
	
	public List<PlanVo> selectList(){
		
		SqlSession sqlSess = getSqlSesstionFactory().openSession();
		
		try{
			
			return sqlSess.selectList(namespace+".selectComment");
			
		}finally{
			sqlSess.close();
		}
		
		
	}
	
	

}
