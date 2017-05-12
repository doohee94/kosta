package repository.cost;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.cost.CostVo;

public class CostRepository {
//매버 별칭 변수선언
	String namespace="CostMapper";
	String statment="";
//sql 함수 호출
	private SqlSessionFactory getSelSessionFactory(){
		String resource = "mybatis-config.xml";
		InputStream inputStream=null;
		try{
			inputStream = Resources.getResourceAsStream(resource);
		}catch(Exception ex){
			
		}
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		return factory;
	}
	public CostVo selectCostView(String memberId, int costNum){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		HashMap map = new HashMap();
		map.put("memberId", memberId);
		map.put("costNum", costNum);
		statment = namespace+".selectCostView";
		return sqlSess.selectOne(statment, map);
		}finally{
			sqlSess.close();
		}
	}
	public List<CostVo> selectCostList(){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		
		return sqlSess.selectList(namespace+".selectCostList");
		}finally{
			sqlSess.close();
		}
	}
	public CostVo deleteCost(String memberId, int costNum){
		int result = 0;
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		HashMap map = new HashMap();
		map.put("memberId", memberId);
		map.put("costNum", costNum);
		statment = namespace+".deleteCost";
		 result = sqlSess.delete(statment, map);
		if(result > 0){
				sqlSess.commit();
				//JDBC : auto-commit, Mybatis : auto아님
			}else{
				sqlSess.rollback();
			}		
		}finally{
			sqlSess.close();
		}
		return null;
	}
	public CostVo modifyCost(CostVo c){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		HashMap map = new HashMap();
		map.put("memberId", c.getMemberId());
		map.put("costNum", c.getCostNum());
		statment = namespace+".modifyCost";
		int result = sqlSess.update(statment, c);
		if(result>0){
			sqlSess.commit();
		}else{
			sqlSess.rollback();
		}
			}finally{
				sqlSess.close();
		}
		return c;
	}
	public Integer insertCost(CostVo c){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		statment = namespace+".insertCost";
		int result = sqlSess.insert(statment, c);
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
	
	
}
