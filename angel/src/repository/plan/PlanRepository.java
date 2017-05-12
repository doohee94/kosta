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
	
		public int Insert(PlanVo vo){
			System.out.println("인서트 레포");
			SqlSession sqlSess = getSqlSesstionFactory().openSession();
			
			try{
				
				int result =  sqlSess.insert(namespace+".insertComment",vo);
				if(result >0 ){
					sqlSess.commit();
					System.out.println("커밋");
					//jdbc : auto-commit, Mybatis : 아님 반드시 커밋 or 롤백
				}else{
					sqlSess.rollback();
					System.out.println("롤백");
				}
				
				
			}finally{
				System.out.println("파이널리");
				sqlSess.close();
			}
			
			return 0;
		
	}
	
	

}
