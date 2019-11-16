package com.atlantis.service;


import com.atlantis.entity.Admin;



/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月15日 下午5:56:02
 * @explain:
 */

public interface LoginService {

	Admin loginAdmin(Admin admin);
	
	int updPassword(Admin admin);

}
