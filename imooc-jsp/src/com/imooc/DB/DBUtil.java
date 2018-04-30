package com.imooc.DB;

import java.util.HashMap;
import java.util.Map;

import com.imooc.bean.Emp;

public class DBUtil {
	public static Map<String, Emp> map = new HashMap<String, Emp>();
	static{
		map.put("101", new Emp("101", "aa", "123456", "111@qq.com"));
		map.put("102", new Emp("102", "bb", "123456", "112@qq.com"));
		map.put("103", new Emp("103", "cc", "123456", "113@qq.com"));
		map.put("104", new Emp("104", "dd", "123456", "114@qq.com"));
	}
	
	public static boolean selectEmpByAccountAndPassword(Emp emp){
		boolean flag = false;
		for(String key : map.keySet()){
			Emp e = map.get(key);
			if(emp.getAccount().equals(e.getAccount()) 
					&& emp.getPassword().equals(e.getPassword())){
				flag = true;
				break;
			}
		}
		return flag;
	}
}
