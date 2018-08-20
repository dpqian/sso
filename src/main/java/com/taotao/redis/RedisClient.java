package com.taotao.redis;

public interface RedisClient {
	
	public String set(String key,String value);
	
	public String get(String key);
}
