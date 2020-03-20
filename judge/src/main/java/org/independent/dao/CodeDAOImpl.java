package org.independent.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Autowired
	public SqlSession sqlsession;
	@Override
	public void insertCode(String code) {
		
		sqlsession.insert("insertC",code);
	}

}
