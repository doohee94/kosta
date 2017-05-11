package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import pds.model.PdsPhoto;
import pds.model.PdsPhotodao;
import pds.model.jdbc.ConnectionProvider;
import pds.model.jdbc.JdbcUtil;

public class AddPdsPhotoService {

	private static AddPdsPhotoService instance = new AddPdsPhotoService();
	public static AddPdsPhotoService getInstance() {
		return instance;
	}
	
	private AddPdsPhotoService() {
	}
	
	public PdsPhoto add(PdsPhoto PdsPhoto) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			int id = PdsPhotodao.getInstance().insert(conn, PdsPhoto);
			if (id == -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB 입력 실퍠 ");
			}
			PdsPhoto.setPhoto_num(id);
			
			conn.commit();
			
			return PdsPhoto;
		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
				}
			}
			//JdbcUtil.close(conn);
		}
	}
}
