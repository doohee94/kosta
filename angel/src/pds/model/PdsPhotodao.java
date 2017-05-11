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
			// 이 쿼리는 pds_item_id 가 순서가 완전히 정확하게 순차적일 때 가능
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
		item.setPhoto_num(rs.getInt("Photo_num"));
		item.setMember_id(rs.getString("member_id"));
		item.setPhoto_name(rs.getString("photo_name"));
		item.setPhoto_path(rs.getString("Photo_path"));
		item.setPhoto_size(rs.getLong("Photo_size"));
		item.setPhoto_content(rs.getString("Photo_content"));
		item.setPhoto_coupleck(rs.getString("Photo_coupleck"));

		return item;
	}

	public PdsPhoto selectById(Connection conn, int Photo_num) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from photo  where Photo_num = ?");
			pstmt.setInt(1, Photo_num);
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
			pstmt = conn.prepareStatement("insert into photo "
					+ "(photo_num, member_id, photo_name, photo_path, photo_size, "
					+"photo_content, photo_coupleck) "
					+ "values (seq_pos_item_id.nextval,?, ?, ?, ?, 0, ?)");
			pstmt.setInt(1, item.getPhoto_num());
			pstmt.setString(2, item.getPhoto_name());
			pstmt.setLong(3, item.getPhoto_size());
			pstmt.setString(4, item.getPhoto_content());
			int insertedCount = pstmt.executeUpdate();

			if (insertedCount > 0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select seq_pos_item_id.currval from dual");
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

	public int increaseCount(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update pds_item set downcount = downcount + 1 where pds_item_id = ?");
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
}
