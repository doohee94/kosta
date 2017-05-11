package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import pds.model.PdsPhoto;
import pds.model.PdsPhotodao;
import pds.model.jdbc.ConnectionProvider;
import pds.model.jdbc.JdbcUtil;


public class GetPdsPhotoService {

	private static GetPdsPhotoService instance = new GetPdsPhotoService();

	public static GetPdsPhotoService getInstance() {
		return instance;
	}

	private GetPdsPhotoService() {
	}

	public PdsPhoto getPdsPhoto(int id) throws PdsPhotoNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			PdsPhoto pdsPhoto = PdsPhotodao.getInstance().selectById(conn, id);
			if (pdsPhoto == null) {
				throw new PdsPhotoNotFoundException("해당 게시물이 없습니다:" + id);
			}
			return pdsPhoto;
		} catch (Exception e) {
			throw new RuntimeException("DB 검색 실패: " + e.getMessage(), e);
		} finally {
			//JdbcUtil.close(conn);
		}
	}
}
