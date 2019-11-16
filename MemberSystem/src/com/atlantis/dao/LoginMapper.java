
package com.atlantis.dao;

import com.atlantis.entity.Admin;

/**
 * 
 * @author Atlantis
 * @version 创建时间：2019年5月16日 下午12:58:05
 * @explain:
 */

public interface LoginMapper {
	/**
	 * 验证管理员的账号密码是否正确
	 */
	Admin loginAdmin(Admin admin);
	
	/**
	 * 修改管理员密码
	 */
	int updPassword(Admin admin);
}
