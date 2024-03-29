package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {

    public static String getValue(String key){
        Properties prop = new Properties();     //创建Properties对象
        InputStream in = new PropertiesUtil().getClass().getResourceAsStream("/exam.properties");
        try {
            prop.load(in);    //对对象的操作
        } catch (IOException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
        return (String)prop.get(key);
    }


}
