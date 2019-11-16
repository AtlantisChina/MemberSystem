package com.atlantis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlantis.dao.LoginMapper;
import com.atlantis.entity.Admin;
import com.atlantis.service.LoginService;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午1:03:48
 * @explain:
 */

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;

	@Override
	public Admin loginAdmin(Admin admin) {
		return loginMapper.loginAdmin(admin);
	}

	@Override
	public int updPassword(Admin admin) {		
		return loginMapper.updPassword(admin);
	}

}
