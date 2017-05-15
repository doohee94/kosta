package pds.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import pds.model.jdbc.JdbcUtil;

public class PdsPhotodao {
	
	private static PdsPhotodao instance = new PdsPhotodao();
	public static PdsPhotodao getInstance() {
		return instance;
	}
	
	private PdsPhotodao() {
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from photo");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	
	
	public List<PdsPhoto> select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//----------
			// �� ������ pds_item_id �� ������ ������ ��Ȯ�ϰ� �������� �� ����
			// pstmt = conn.prepareStatement("select * from pds_item where pds_item_id between ? and ? order by pds_item_id desc");
//			pstmt.setInt(1, firstRow - 1);
//			pstmt.setInt(2, endRow - firstRow + 1);
			
			
			pstmt = conn.prepareStatement("select * from photo  order by photo_num desc");
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				return Collections.emptyList();
			}
			List<PdsPhoto> photoList = new ArrayList<PdsPhoto>();
			do {
				PdsPhoto article = makePhotoFromResultSet(rs);
				photoList.add(article);
			} while (rs.next());
			return photoList;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private PdsPhoto makePhotoFromResultSet(ResultSet rs) throws SQLException {
		PdsPhoto item = new PdsPhoto();
		item.setPhoto_num(rs.getInt("photo_num"));
		item.setMember_id(rs.getString("member_id"));
		item.setPhoto_name(rs.getString("photo_name"));
		item.setPhoto_path(rs.getString("Photo_path"));
		item.setPhoto_size(rs.getLong("photo_size"));
		item.setPhoto_title(rs.getString("photo_title"));
		item.setPhoto_content(rs.getString("photo_content"));
		item.setPhoto_coupleck(rs.getString("photo_coupleck"));

		return item;
	}

	public PdsPhoto selectById(Connection conn, int photo_num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from photo  where Photo_num = ?");
			pstmt.setInt(1, photo_num);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				return null;
			}
			PdsPhoto item = makePhotoFromResultSet(rs);
			return item;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int insert(Connection conn, PdsPhoto item) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			System.out.println("0");
			String sql = "insert into photo "
					+ "(photo_num, member_id, photo_name, photo_path, photo_size, "
					+"photo_title ,photo_content, photo_coupleck) "
					+ "values (seq_photo_num.nextval,?, ?, ?, ?, ?, ?, ?)";
			System.out.println("1");
			pstmt = conn.prepareStatement(sql);
			System.out.println("sql->" + sql );
			pstmt.setString(1, "pika");  //pika대신 사용자아이디로 대체해야됨
			System.out.println("11");
			//pstmt.setString(1, item.getMember_id());
			pstmt.setString(2, item.getPhoto_name());
			System.out.println("22");
			pstmt.setString(3, item.getPhoto_path());
			System.out.println("33");
			pstmt.setLong(4, item.getPhoto_size());
			System.out.println("44");
			pstmt.setString(5, item.getPhoto_title());
			pstmt.setString(6, item.getPhoto_content());
			System.out.println("55");
			//pstmt.setString(6, item.getPhoto_coupleck());
			pstmt.setString(7, "yes");
			int insertedCount = pstmt.executeUpdate();
			System.out.println("66");
			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select seq_photo_num.currval from photo");
				if (rs.next()) {
					return rs.getInt(1);
				}
			}
			return -1;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}

	public int increaseCount(Connection conn, int photo_num) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update photo set downcount = downcount + 1 where photo_num = ?"); //Ȯ���ؾߵ� //////////
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
//	public int updatePhoto(Connection conn, int photo_num)throws SQLException{
//	Statement stmt = null;
//	ResultSet rs = null;
//	PreparedStatement pstmt = null;
//	String sql = "select rownum, photo_num, photo_path from photo where rownum<11";
//	
//	try {
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, photo_num);
//		rs = pstmt.executeQuery();
////		if (!rs.next()) {
////			return null;
////		}
////		PdsPhoto item = makePhotoFromResultSet(rs);
////		return item;
//	} finally {
//		JdbcUtil.close(rs);
//		JdbcUtil.close(pstmt);
//	}
//}

}