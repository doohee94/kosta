package repository.diary;


import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.diary.model.Diary;

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
	   
	   
	   public List<Diary> selectList(String memberId, String coupleId){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   
		   try{
			   HashMap map = new HashMap();
			   
			   map.put("memberId", memberId);
			   map.put("coupleId", coupleId);
			   if(coupleId == null){
				   return sqlSess.selectList(namespace + ".selectComment", map);
				   
			   }else{
				   return sqlSess.selectList(namespace + ".coupleSelectComment", map );
				   
			   }
		   }finally{
			   sqlSess.close();
		   }
		   
	   }
	
	
	   public Diary selectView(int diarynum){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   HashMap map = new HashMap();
			   
			   map.put("diarynum", diarynum);
			   return sqlSess.selectOne(namespace + ".selectone", map);
			}finally{
				sqlSess.close();
			}
	   }
	   public int insertView(Diary d){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   int result = sqlSess.insert(namespace + ".insertone", d);
			   if(result >0 ){
	               sqlSess.commit();
	               System.out.println("커밋");
	               //jdbc : auto-commit, Mybatis : 아님 반드시 커밋 or 롤백
	            }else{
	               sqlSess.rollback();
	               System.out.println("롤백");
	            }
		   }finally{
			   sqlSess.close();
		   }
		   
		   return 0;
	   }
	   public int deleteView(int diarynum){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   int result = sqlSess.delete(namespace + ".deleteone", diarynum);
			   if(result >0 ){
	               sqlSess.commit();
	               System.out.println("커밋");
	               //jdbc : auto-commit, Mybatis : 아님 반드시 커밋 or 롤백
	            }else{
	               sqlSess.rollback();
	               System.out.println("롤백");
	            }
		   }finally{
			   sqlSess.close();
		   }
		   
		   return 0;
	   }
	   public int modifyView(Diary d){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   int result = sqlSess.update(namespace + ".updateone", d);
			   if(result >0 ){
	               sqlSess.commit();
	               System.out.println("커밋");
	               //jdbc : auto-commit, Mybatis : 아님 반드시 커밋 or 롤백
	            }else{
	               sqlSess.rollback();
	               System.out.println("롤백");
	            }
		   }finally{
			   sqlSess.close();
		   }
		   
		   return 0;
	   }
	   public List<Diary> researchList(String memberId,String diarydate){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   HashMap map = new HashMap();
			   
			   map.put("diarydate", diarydate+"%");
			   map.put("memberId", memberId);
			   System.out.println("레포지터리>>>>>>>>>>>>>>"+diarydate);
			   return sqlSess.selectList(namespace + ".research", map );
		   }finally{
			   
			   sqlSess.close();
		   }
	  
	   }
	   public int insertViewCouple(Diary d){
		   SqlSession sqlSess = getSqlSesstionFactory().openSession();
		   try{
			   int result = sqlSess.insert(namespace + ".insertonecouple", d);
			   if(result >0 ){
	               sqlSess.commit();
	               System.out.println("커밋");
	               //jdbc : auto-commit, Mybatis : 아님 반드시 커밋 or 롤백
	            }else{
	               sqlSess.rollback();
	               System.out.println("롤백");
	            }
		   }finally{
			   sqlSess.close();
		   }
		   
		   return 0;
	   }
	   
}
