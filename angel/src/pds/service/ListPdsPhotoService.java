package pds.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import pds.model.PdsPhoto;
import pds.model.PdsPhotodao;
import pds.model.jdbc.ConnectionProvider;
import pds.model.jdbc.JdbcUtil;


public class ListPdsPhotoService {

	private static ListPdsPhotoService instance = new ListPdsPhotoService();

	public static ListPdsPhotoService getInstance() {
		return instance;
	}

	private ListPdsPhotoService() {
	}

	public List<PdsPhoto> getPdsPhotoList() {
		
		PdsPhotodao pdsPhotodao = PdsPhotodao.getInstance();
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			return  pdsPhotodao.select(conn);
		} catch (Exception e) {
			throw new RuntimeException("DB 자료실 검색 실패 :" + e.getMessage(), e);
		} finally {
			//JdbcUtil.close(conn);
		}
	}
	
}
