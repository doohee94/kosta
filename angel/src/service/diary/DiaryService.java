package service.diary;

import java.util.List;

import mybatis.diary.model.Diary;
import repository.diary.DiaryRepository;

public class DiaryService {
	private static DiaryService service;
	   
	   private DiaryService(){}
	   
	   public static DiaryService getInstance(){
	      
	      if(service == null)
	      {
	         service =  new DiaryService();
	      }
	      return service;
	   }
	   
	   
	   DiaryRepository repo = new DiaryRepository();
	   
	   public List<Diary> selectList(String memberId, String coupleId ){
		   return repo.selectList(memberId, coupleId );
	   }
	   public Diary selectView(int diarynum){
		   return repo.selectView(diarynum);
	   }
	   public int insertView(Diary d){
		   return repo.insertView(d);
	   }
	   public int deleteView(int diarynum){
		   return repo.deleteView(diarynum);
	   }
	   public int modifyView(Diary d){
		   return repo.modifyView(d);
	   }
	   public List<Diary> researchList(String memberId, String diarydate){
		   return repo.researchList(memberId,diarydate);
	   }
	   public int insertViewCouple(Diary d){
		   return repo.insertViewCouple(d);
	   } 
}
