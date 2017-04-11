package com.yqjr.commons.shiro;

import com.yqjr.commons.helper.PasswordHelper;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.UserInfoService;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Description
 * 
 * @author Robin
 * @version V1.0
 * @createDateTime：2014-10-30 11:35:26
 * @Company:
 * @Copyright: Copyright (c) 2014
 **/
public class RetryLimitHashedCredentialsMatcher extends
		HashedCredentialsMatcher {
	private Cache<Object, AtomicInteger> passwordRetryCache;
	@Autowired
	UserInfoService userInfoService;
	@Autowired
	PasswordHelper passwordHelper;

	public RetryLimitHashedCredentialsMatcher(CacheManager cacheManager) {
		passwordRetryCache = cacheManager.getCache("passwordRetryCache");
	}

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token,
			AuthenticationInfo info) {
		String userName = (String) token.getPrincipal();
		// retry count + 1
		AtomicInteger retryCount = passwordRetryCache.get(userName);
		if (retryCount == null) {
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(userName, retryCount);
		} else {
			passwordRetryCache.remove(userName);
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(userName, retryCount);
		}
		if (retryCount.incrementAndGet() >= 3) {
			if (retryCount.incrementAndGet() > 5)
				throw new ExcessiveAttemptsException();

			UserInfoDO userDO = new UserInfoDO();
			userDO.setLocked(true);
			userDO.setUserName(userName);
			try {
				userInfoService.updateUser(userDO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		boolean matches = super.doCredentialsMatch(token, info);
		if (matches) {
			// clear retry count
			passwordRetryCache.remove(userName);
		}
		return matches;
	}
}
