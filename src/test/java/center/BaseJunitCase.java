package center;
/**
  * @FileName: sdf.java
  * @Author 
  * @Description:
  * @Date 2016年5月26日 下午1:50:21
  * @CopyRight yazhuokj Corporation
  */

import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = { "classpath*:/spring/spring-servlet.xml","classpath:/spring/spring-bean.xml","classpath:/spring/spring-core.xml","classpath:/spring/mybatis-config.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class BaseJunitCase {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());
    private static boolean inited = false;

    @BeforeClass
    public static void init() {
        try {
            if (!inited) {
                System.out.println("Initializing running ...");
                System.setProperty("sun.jnu.encoding", "UTF-8");
                System.setProperty("file.encoding", "UTF-8");


                inited = true;
            } else {
                System.out.println("inited: " + inited);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	
}

