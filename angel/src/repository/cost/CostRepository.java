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
	//그래프 만들때 찾아오는 sql문 부르는 메소드
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
	//리스트 불러올때 쓰는 sql문 부르는 메소드
	public List<CostVo> selectCostList(String memberId){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		try{
		
		return sqlSess.selectList(namespace+".selectCostList", memberId);
		}finally{
			sqlSess.close();
		}
	}
	//delete 하는 sql문 부르는 메소드
	public int deleteCost(String memberId, int costNum){
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
		return result;
	}
	//modify 하는 sql문 부르는 메소드
	public Integer modifyCost(CostVo c){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		int result = 0;
		try{
		statment = namespace+".modifyCost";
		result = sqlSess.update(statment,c);
		if(result>0){
			sqlSess.commit();
		}else{
			sqlSess.rollback();
		}
			}finally{
				sqlSess.close();
		}
		return result;
	}
	//값들을 삽입하는 sql문 부르는 메소드
	public Integer insertCost(CostVo c){
		SqlSession sqlSess = getSelSessionFactory().openSession();
		int result = 0;
		try{
		statment = namespace+".insertCost";
		result = sqlSess.insert(statment, c);
		if(result > 0){
			sqlSess.commit();
		}else{
			sqlSess.rollback();
		}
		}finally{
			sqlSess.close();
		}
		return result;
	}
	
	
}
