package org.pwm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.pwm.model.SearchDetails;
import org.pwm.util.DBConnectionUtil;
import org.springframework.stereotype.Component;

@Component
public class PwmDAO {

	private static final Logger logger = LogManager.getLogger(PwmDAO.class);

	/**
	 * 
	 * @return
	 */
	public Map<String, List<String>> getDataMap() {

		Map<String, List<String>> dataMap = new HashMap<String, List<String>>();
		Connection connection = null;
		Statement statement = null;
		try {
			connection = DBConnectionUtil.getDBConnection();

			// Step 2.B: Creating JDBC Statement
			statement = connection.createStatement();

			List<String> labelsList = getLabels(statement);

			if (labelsList != null && labelsList.size() > 0) {
				for (int i = 0; i < labelsList.size(); i++) {
					String label = (String) labelsList.get(i);
					String tableName = "PWM_" + label + "_Master";
					List<String> fetchedList = getRequiredList(tableName, statement);
					dataMap.put(label.toLowerCase() + "List", fetchedList);
				}
			}
		} catch (SQLException e) {
			System.out.println("Exception occurred while reading the database");
		} finally {

			// Step 3: Closing database connection
			try {
				if (null != connection) {
					// cleanup resources, once after processing
					statement.close();
					// and then finally close connection
					connection.close();
				}
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		}

		return dataMap;
	}

	/**
	 * 
	 * @param statement
	 * @return
	 */
	public List<String> getLabels(Statement statement) {
		List<String> labelsList = new ArrayList<String>();

		ResultSet resultSet = null;

		try {
			resultSet = statement.executeQuery("SELECT * FROM PWM_Labels");

			// processing returned data and printing into console
			while (resultSet.next()) {
				System.out.println(resultSet.getInt(1) + "\t" + resultSet.getString(2));
				labelsList.add(resultSet.getString(2));

			}
		} catch (Exception ex) {
			System.out.println("Exception occurred while reading labels master table");
		}

		return labelsList;
	}

	/**
	 * 
	 * @param tableName
	 * @param statement
	 * @return
	 */
	public List<String> getRequiredList(String tableName, Statement statement) {
		List<String> rList = new ArrayList<String>();

		ResultSet resultSet = null;

		try {
			resultSet = statement.executeQuery("SELECT * FROM " + tableName);

			// processing returned data and printing into console
			while (resultSet.next()) {
				System.out.println(resultSet.getInt(1) + "\t" + resultSet.getString(2));
				rList.add(resultSet.getString(2));

			}
		} catch (Exception ex) {
			System.out.println("Exception occurred while reading labels master table");
		}

		return rList;
	}

	/**
	 * 
	 * @param searchDetails
	 * @return
	 * @throws SQLException
	 */
	public String fetchPassWord(SearchDetails searchDetails) throws SQLException {

		String envType = searchDetails.getEnvironment();
		String user = searchDetails.getUser();
		String application = searchDetails.getApplication();
		String password = "";

		System.out.println("envType obtained" + envType);
		Connection connection = null;

		Statement statement = null;
		Statement fetchStatement = null;

		ResultSet resultSet = null;
		ResultSet fetchSet = null;

		int index = 0;

		List<String> queriesList = new ArrayList<String>();
		queriesList.add("SELECT Env_ID FROM  PWM_Environment_Master where Env_Type='" + envType + "'");
		queriesList
				.add("SELECT Application_ID FROM PWM_Application_Master where Application_Name='" + application + "'");
		queriesList.add("SELECT User_ID FROM  PWM_User_Master where User_Name='" + user + "'");

		try {
			connection = DBConnectionUtil.getDBConnection();
			System.out.println("Connection Established...");
			// Step 2.B: Creating JDBC Statement
			statement = connection.createStatement();
			for (String query : queriesList) {
				index++;
				try {
					System.out.println("query to get executed.." + query);
					resultSet = statement.executeQuery(query);
					while (resultSet.next()) {
						int id_index = resultSet.getInt(1);
						if (index == 1) {
							searchDetails.setEnvID(id_index);
						}
						if (index == 2) {
							searchDetails.setApplicationID(id_index);
						}
						if (index == 3) {
							searchDetails.setUserID(id_index);

						}
					}
				} finally {
					// resultSet.close();
				}
			}

			String exQuery = "SELECT Password FROM PWM_Credentials where Env_ID=" + searchDetails.getEnvID()
					+ " AND Application_ID=" + searchDetails.getApplicationID() + " AND User_ID="
					+ searchDetails.getUserID();

			System.out.println("exQuery:..." + exQuery);

			fetchStatement = connection.createStatement();
			fetchSet = fetchStatement.executeQuery(exQuery);
			try {
				while (fetchSet.next()) {
					password = fetchSet.getString(1);
				}
			} finally {
				fetchSet.close();
			}

		} catch (Exception ex) {
			System.out.println("Exception Occurred..." + ex);
			ex.printStackTrace();
		} finally {
			statement.close();
			// fetchStatement.close();
			connection.close();
		}
		return password;

	}

	/**
	 * 
	 * @param userId
	 * @param password
	 * @return
	 */
	public String validateUser(String userId, String password) {

		String validateFlag = "N";
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = DBConnectionUtil.getDBConnection();
			// Step 2.B: Creating JDBC Statement
			statement = connection.createStatement();
			String query= "SELECT * FROM PWM_USERS where USER_ID='" + userId + "' AND PASSWORD='" + password + "'";
			System.out.println("query..."+query);
			resultSet = statement.executeQuery(query);
			
			System.out.println("hello there"+"hi");
			while (resultSet.next()) {
				validateFlag = "Y" + "|" + resultSet.getString("ROLE");
				System.out.println("hi inside if...");
			}
		} catch (Exception ex) {
			System.out.println("Exception occurred while fetching user details.." + ex);
		} finally {
			try {
				connection.close();
				statement.close();
			} catch (SQLException ex) {
				System.out.println("Exception occurred while closing the connection." + ex);
			}
		}
		System.out.println("validateFlag.." + validateFlag);
		return validateFlag;

	}

}
