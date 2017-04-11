package com.yqjr.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.yqjr.commons.base.BaseService;
import com.yqjr.commons.exception.ServiceException;
import com.yqjr.commons.helper.PasswordHelper;
import com.yqjr.dao.UserInfoDao;
import com.yqjr.dao.UserRoleDao;
import com.yqjr.entity.UserInfoDO;
import com.yqjr.service.UserInfoService;

@Service("userInfoService")
public class UserInfoServiceImpl extends BaseService implements UserInfoService {

	@Autowired
	private UserInfoDao userInfoDao;
	@Autowired
	private PasswordHelper passwordHelper;
	@Autowired
	private UserRoleDao userRoleDao;

	@Override
	public List<UserInfoDO> getUsers(int userId) throws ServiceException {
		List<UserInfoDO> list = new ArrayList<UserInfoDO>();
		list = userInfoDao.getUsers(userId);
		return list;
	}

	@Override
	public List<UserInfoDO> getUsers(Map<String, Object> map)
			throws ServiceException {
		List<UserInfoDO> list = new ArrayList<UserInfoDO>();
		list = userInfoDao.getUsersByMap(map);
		return list;
	}

	@Override
	public UserInfoDO queryUserInfo(String name) {
		return userInfoDao.queryUserByName(name);
	}

	@Override
	public int queryUserInfo(String userId, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<UserInfoDO> list = userInfoDao.getUsers(Integer.parseInt(userId));
		UserInfoDO userInfo = list.get(0);
		UserInfoDO userInfo2 = new UserInfoDO();
		userInfo2.setUserId(Integer.parseInt(userId));
		userInfo2.setSalt(userInfo.getSalt());
		userInfo2.setPassword(password);
		map.put("userId", userId);
		try {
			passwordHelper.encryptPassword2(userInfo2);
			map.put("password", userInfo2.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfoDao.queryUserInfo(map);
	}

	@Override
	public int updateUser(UserInfoDO userDO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userDO.getUserId());
		map.put("password", userDO.getPassword());
		map.put("salt", userDO.getSalt());
		map.put("updateTime", "updateTime");
		return userInfoDao.updateUser(map);
	}

	@Override
	public int updateUser2(Map<String, Object> map) {
		return userInfoDao.updateUser(map);
	}

	@Override
	public UserInfoDO addUserInfo(UserInfoDO infoDO) {
		userInfoDao.addUserInfo(infoDO);
		return infoDO;
	}

	@Override
	public int addUserMenu(Map<String, Object> map) {
		userInfoDao.delUserMenu(map);
		return userInfoDao.addUserMenu(map);
	}

	@Override
	public int delUserInfo(Map<String, Object> map) {
		return userInfoDao.delUserInfo(map);
	}

	@Override
	public UserInfoDO getUserInfoById(int userId) {
		List<UserInfoDO> list = userInfoDao.getUsers(userId);
		if (list != null && list.size() > 0) {
			return userInfoDao.getUsers(userId).get(0);

		} else {
			return null;
		}
	}

	@Override
	public List<UserInfoDO> getUsersByRoleName(String[] roleNameArray) {
		return userInfoDao.getUsersByRoleName(roleNameArray);
	}

	/**
	 * 获取首页上的统计信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> queryChartCount(Map<String, Object> map) {
		Integer type = Integer.parseInt(map.get("type").toString());
//		List<Map<String, Object>> list = indexDao.queryChartData(map);
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Set<String> legendDataSet = new HashSet<String>();
		JSONArray legendData = new JSONArray();// 样例数据
												// ['手机','平板','电脑','相机','其他']
		JSONArray xAxisData = new JSONArray();// 样例数据
												// ['周一','周二','周三','周四','周五','周六','周日']
		JSONArray series = new JSONArray();
		/*
		 * series的样例数据 [ { name:'手机', type:'line', data:[120, 132, 101, 134, 90,
		 * 230, 210],
		 * 
		 * }, { name:'平板', type:'line', data:[220, 182, 191, 234, 290, 330, 310]
		 * } ]
		 */

		// 获取图表的图例(统计了几个数据)。 并创建一个所有数据的Map,map的key为横坐标与图例拼接的字符串
		List<Map<String, Object>> seriesList = new ArrayList<Map<String, Object>>();
		Map<String, Object> tmpAllData = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> tmpMap = list.get(i);
			if (legendDataSet.add(tmpMap.get("pName").toString())) {
				legendData.add(tmpMap.get("pName").toString());
			}
			tmpAllData.put(
					tmpMap.get("createDate").toString()
							+ tmpMap.get("pName").toString(),
					tmpMap.get("count"));

		}

		// 横坐标默认为一个月的天数，循环每个横坐标时各个图例的数据，并按顺序设置到List中，没有数据的位置为0
		Calendar cal = Calendar.getInstance();
		// cal.add(Calendar.MONTH, -1);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
		// int maxDayOfCurrMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int items = 31;
		if (type == 1) {
			items = 12;
			cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) - items);
			cal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号 防止当月没有指定日期 如2月没有29号
												// 就会跳到下个月
		} else {
			items = 31;
			cal.set(Calendar.DATE, cal.get(Calendar.DATE) - items);
		}

		for (int i = 0; i < items; i++) {
			// 获取横坐标
			String currDate = "";
			if (type == 1) {
				cal.set(Calendar.MONTH, cal.get(Calendar.MONTH) + 1);
				currDate = sdf1.format(cal.getTime());
			} else {
				cal.set(Calendar.DATE, cal.get(Calendar.DATE) + 1);
				currDate = sdf2.format(cal.getTime());
			}

			xAxisData.add(currDate);

			for (int j = 0; j < legendData.size(); j++) {
				Object tmpObject = tmpAllData.get(currDate + legendData.get(j));
				// 没有值得地方设置为0，保证生成的数组的个数不会少
				if (tmpObject == null || tmpObject.equals("")) {
					tmpObject = 0;
				}

				if (seriesList.size() <= j) {
					seriesList.add(new HashMap<String, Object>());
				}
				seriesList.get(j).put("name", legendData.get(j));
				seriesList.get(j).put("type", "line");
				if (seriesList.get(j).get("data") == null) {
					seriesList.get(j).put("data", new ArrayList<Object>());
				}
				((List<Object>) seriesList.get(j).get("data")).add(tmpObject);
			}
		}

		series = JSONArray.parseArray(JSONArray.toJSONString(seriesList));
		resultMap.put("legendData", legendData.toJSONString());
		resultMap.put("xAxisData", xAxisData.toJSONString());
		resultMap.put("seriesList", series.toJSONString());

		return resultMap;
	}

	@Override
	public List<Integer> queryAuditQuence(Integer userId) {
		return userRoleDao.queryAuditQuence(userId);
	}

}
