package repository.diary;


import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.diary.DiaryVo;

public class DiaryRepository {
	
	
	private String namespace = "mapper.diary.DiaryMapper";
	   
	   
	   
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
	   
	   
	   public List<DiaryVo> selectList(){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   return sqlSess.selectList(namespace + ".selectComment");
		   }finally{
			   sqlSess.close();
		   }
	  
	   }
	
	
	   public DiaryVo selectView(int diarynum){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   HashMap map = new HashMap();
			   map.put("diarynum", diarynum);
			   return sqlSess.selectOne(namespace + ".selectone", map);
			}finally{
				sqlSess.close();
			}
	   }
}
