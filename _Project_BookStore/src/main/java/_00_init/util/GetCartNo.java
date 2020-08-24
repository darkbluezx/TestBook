package _00_init.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GetCartNo {
	private DataSource ds = null;
	private int serno = 0;
	private String str = "";
	private String str2 = "";


	public GetCartNo() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup(DBService.JNDI_DB_NAME);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("GetCartNo類別#建構子發生例外: " + ex.getMessage());
		}
	}

	public String getKey() {
		Date date = new Date();
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyyMMdd");
		str = bartDateFormat.format(date);
		if (keyExists(str)) {
			serno = serno + 1;
			String String_serno = String.format("%06d", serno);
			str2 = str + String_serno;
			updateSerno();
		} else {
			serno = 1;
			String String_serno = String.format("%06d", serno);
			str2 = str + String_serno;
			insertSerno();
		}
		return str2;
	}

	private void insertSerno() {
		String sql = "insert into CartNo " + " (key_date, serno) " + " values (?, ?)";
		try (Connection con = ds.getConnection(); PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, str);
			ps.setInt(2, serno);
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("GetCartNo類別#insertSerno()發生例外: " + ex.getMessage());
		}
	}

	private void updateSerno() {
		String sql1 = "UPDATE CartNo SET serno = ? " + " WHERE key_date = ?";

		try (Connection conn = ds.getConnection();PreparedStatement ps1 = conn.prepareStatement(sql1);) {
			ps1.setInt(1, serno);
			ps1.setString(2, str);
			ps1.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("GetCartNo類別#updateSerno()發生SQL例外: " + ex.getMessage());
		}

	}

	public boolean keyExists(String key) {
		boolean exist = false;
		String sql = "SELECT * FROM CartNo WHERE key_date = ?";
		try (Connection conn = ds.getConnection(); PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setString(1, key);
			try (ResultSet rs = ps.executeQuery();) {
				if (rs.next()) {
					exist = true;
					serno = rs.getInt("serno");
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("GetCartNo類別#keyExists()發生例外: " + ex.getMessage());
		}
		return exist;
	}

}
