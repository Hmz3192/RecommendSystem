package com.zjnu.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisUtil {
    private static String ADDR = "101.201.234.133";
    private static int PORT = 6379;
    private static String AUTH = "123456";

    private static int MAX_ACTIVE = 102400;

    private static int MAX_IDLE = 2000000;

    private static int MAX_WAIT = 1000000;

    private static int TIMEOUT = 36000000;

    private static boolean TEST_ON_BORROW = true;

    private static JedisPool jedisPool = null;

    static {
        try{
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxTotal(MAX_ACTIVE);
            config.setMaxIdle(MAX_IDLE);
            config.setMaxWaitMillis(MAX_WAIT);
            config.setTestOnBorrow(TEST_ON_BORROW);
            jedisPool = new JedisPool(config,ADDR,PORT,TIMEOUT,AUTH);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public synchronized static Jedis getJedis(){
        try{
            if(jedisPool != null){
                Jedis jedis = jedisPool.getResource();
                return jedis;
            }else{
                return null;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void returnResource(final Jedis jedis){
        if(jedis != null){
            jedisPool.returnResourceObject(jedis);
//            jedisPool.returnResource(jedis);
        }
    }
}
