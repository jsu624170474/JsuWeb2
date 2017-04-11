package com.yqjr.commons.helper;

import com.yqjr.entity.UserInfoDO;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

/**
 * Description
 * 
 * @author Robin
 * @version V1.0
 * @createDateTime：2014-12-22
 * @Company: yqjr.com.cn
 * @Copyright: Copyright (c) 2014
 **/
@Service
public class PasswordHelper {

	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void setRandomNumberGenerator(
			RandomNumberGenerator randomNumberGenerator) {
		this.randomNumberGenerator = randomNumberGenerator;
	}

	public void setAlgorithmName(String algorithmName) {
		this.algorithmName = algorithmName;
	}

	public void setHashIterations(int hashIterations) {
		this.hashIterations = hashIterations;
	}

	public void encryptPassword(UserInfoDO user) {

		user.setSalt(randomNumberGenerator.nextBytes().toHex());

		String newPassword = new SimpleHash(algorithmName, user.getPassword(),
				ByteSource.Util.bytes(user.getSalt()), hashIterations).toHex();
		user.setPassword(newPassword);
	}

	/**
	 * 生成密钥
	 *
	 * @param user
	 * @return
	 */
	public ByteSource getSalt() {

		return ByteSource.Util.bytes(randomNumberGenerator.nextBytes().toHex());
	}

	public void encryptPassword2(UserInfoDO user) {

		// user.setSalt(randomNumberGenerator.nextBytes().toHex());

		String newPassword = new SimpleHash(algorithmName, user.getPassword(),
				ByteSource.Util.bytes(user.getSalt()), hashIterations).toHex();
		user.setPassword(newPassword);
	}

}
