/*
 * Copyright (c) 2012, Andy.fang Corporation, All Rights Reserved
 */
package com.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author Andy.fang
 * @version 1.0
 * @description 本地存储url根地址
 * @createDate 2014年10月16日
 */
public final class URLRoot {

    public static String filename = "assets/url.properties";
    public static String API_PRODUCT_PATH = "http://10.10.2.170:8080";
//    public static String API_PATH = "http://qianchengjinfu.bravocloud-test.cn";
//    public static String API_PATH = "http://uatqiancheng.bravocloud-test.cn";
//    public static String API_PATH = "http://qikuncaifu.bravocloud-test.cn";
//    public static String API_PATH = "http://qikuncaifu.bravowhale-qat.com";
//    public static String API_PATH = "http://ztbanker.bravocloud-test.cn";//xy01/Abc123456   wyl01
    public static String API_PATH = "http://qikun.bravowhale-dev.com:8118";//DEV

//    public static String API_PATH = "http://ztbanker.bravocloud-test.cn";//



//    public static String API_PATH = "https://qianchengjinfu.bravocloud.cn/";//钱橙生产环境

//    public static String API_PATH = "http://uatqiancheng.bravowhale-uat.com";//钱橙uAT

//    public static String API_PATH = "http://qianchengjinfu.bravocloud.cn";//钱橙金符    祺鲲主管/Abc123456
//    public static String API_PATH = "http://cloudpad.bravocloud.cn";//雷池云派生产  bravowhalesuperadmin/bw@2016
//    public static String API_PATH = "http://zhongjinlianmeng.bravocloud.cn";//中金联盟 bravowhalesuperadmin/bw@2016
//    public static String API_PATH = "http://aijianzhengquan.bravocloud-test.cn/";//爱建rc
//    public static String API_PATH = "http://taichengcaifu.bravocloud.cn";//泰城生产  bravowhalesuperadmin/bw@2016
//    public static String API_PATH = "http://taichengcaifu.bravocloud-test.cn";//xy01/Abc123456
//    public static String API_PATH = "http://qianchengjinfu.bravocloud-test.cn";//liuying/Abc123456   cs01  密码Abc123456
//    public static String API_PATH = "http://taichengcaifu.bravocloud-test.cn";//yuli Abc123456

//    public static String API_PATH = "http://ztbanker.bravocloud-test.cn";//展厅 fanghaibo/Abc123456
//    public static String API_PATH = "http://zhexin.bravocloud-test.cn";//浙鑫
//    public static String API_PATH = "http://uatqishengtouzi.bravowhale-uat.com";//企盛
//    public static String API_PATH = "http://ztbanker.bravowhale-qat.com";//展厅 fanghaibo/Abc123456


//    public static String API_PATH = "http://10.66.29.47:8080";//DEV lzl

//    public static String API_PATH = "http://10.66.27.55:9080";//DEV
//    public static String API_PATH = "http://qikuncaifu.bravocloud.cn";//产品测试
//    public static String API_PATH = "http://minxiangcaifu.bravocloud.cn";//产品测试
//    public static String API_PATH = "http://minxiangcaifu.bravocloud.cn";//民响财富云生产环境
//    public static String API_PATH = "http://10.66.27.16:8081";//dcj
//    public static String API_PATH = "http://minxiangcaifu1.bravocloud-test.cn";//民享
//    public static String API_PATH = "http://minxiangcaifu516.bravocloud-test.cn";//民享516
//    public static String API_PATH = "http://qikuncaifu.bravocloud-test.cn";//qikun财富
//    public static String API_PATH = "http://cloudpad.bravocloud-test.cn";//hong6/Abc123456
//    public static String API_PATH = "http://qianchengjinfu.bravocloud-test.cn";//钱橙
//    public static String API_PATH = "http://richibank.bravowhale-qat.com";
//    public static String API_PATH = "http://minxiangcaifu1.bravocloud-test.cn";ssssss
//    public static String API_PATH = "http://qikuncaifuikun.bravowhale-dev.com:8118";
//    public static String API_PATH = "http://10.66.26.139:8080";
//    http://10.10.2.181:8080 金宝develop    http://10.66.103.14:8080    192.168.103.70:8080  192.168.40.223:8080
//    public static String API_PATH = "http://aijianzhengquan.bravowhale-qat.com";//http://10.10.2.181:8080 金宝develop    http://10.66.103.14:8080    192.168.103.70:8080  192.168.40.223:8080
//    public static String API_PATH = "http://jinxin.bravowhale-qat.com";//http://10.10.2.181:8080 金宝develop    http://10.66.103.14:8080    192.168.103.70:8080  192.168.40.223:8080
//    public static String API_PATH = "http://qikuncaifu.bravowhale-qat.com";//http://10.10.2.181:8080 金宝develop    http://10.66.103.14:8080    192.168.103.70:8080  192.168.40.223:8080
//    public static String API_PATH = "http://mybankera.bravocloud.cn"; //
//    public static String API_PATH = "http://ybanker.bravowhale-qat.com:8118"; //测试
//    public static String API_PATH = "http://bingheng.bravocloud-test.cn"; //炳恒准生产
//    public static String API_PATH = "http://bingheng.bravowhale-demo.com"; //炳恒demo
//    public static String API_PATH = "http://bingheng.bravowhale-qat.com/"; //炳恒测试
//    public static String API_PATH = "http://rb.bravowhale-demo.com:8118";//ceshi
//    public static String API_PATH = "http://58.211.121.116:8101";// 金宝demo
//    public static String API_PATH = "http://58.211.121.116:8106";//闪融
//    public static String API_PATH = "http://bingheng.bravowhale-qat.com";// 金宝 test
//    public static String API_PATH = "http://xzbanker.bravocloud-test.cn";// 行早准生产
//    public static String API_PATH = "https://ybanker.bravowhale.com";//生产环境
//    public static String API_PATH = "http://192.168.40.68:8080";// 金宝 test
//    public static String API_PATH = "http://180.97.68.34:65000";// 金宝展厅
//    public static String API_PATH = "http://192.168.40.103:8080";// test
//    public static String API_PATH = "http://ybanker.bravocloud-test.cn:8081";// 准生产
//    http://xzbanker.bravowhale-demo.com:8118//行早
//    http://srbanker.bravowhale-demo.com:8118//闪融
//    http://rb.bravowhale-demo.com:8118 //雷池
//    http://qikuncaifu.bravocloud-test.cn

    public static void setApiPath() {
        Properties prop = new Properties();
        try {
            InputStream in = URLRoot.class.getClassLoader().getResourceAsStream(filename);
            if (in != null) {
                prop.load(in);
                API_PATH = prop.getProperty("API_PATH");
                in.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
