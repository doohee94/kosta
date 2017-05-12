package service.diary;

import java.util.List;

import model.diary.DiaryVo;
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
	   
	   public List<DiaryVo> selectList(){
		   return repo.selectList();
	   }
	   public DiaryVo selectView(int diarynum){
		   return repo.selectView(diarynum);
	   }
}
