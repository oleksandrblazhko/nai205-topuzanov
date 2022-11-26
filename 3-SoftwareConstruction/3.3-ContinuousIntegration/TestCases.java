import java.sql.*;
import oracle.jdbc.driver.*;

class TestCases {

    public static void main(final String[] args) {
        int testcaseResult = 0;
        try{
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
                    args[0],
                    args[1]);

            CallableStatement cstmt1 = con.prepareCall("{? = call send_message(?,?)}");
            cstmt1.registerOutParameter(1,Types.NUMERIC);
            cstmt1.setString(2,"user1");
            cstmt1.setString(3,"p1234");
            cstmt1.executeUpdate();
            System.out.print("TC1: send_message('user1','p1234') очікуваний результат 1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == 1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"user1");
            cstmt1.setString(3,"p1234agfgggggggggggggggggggggg");
            cstmt1.executeUpdate();
            System.out.print("TC2: send_message('user1','p1234agfgggggggggggggggggggggg') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            cstmt1.setString(2,"user1");
            cstmt1.setString(3,"p12344");
            cstmt1.executeUpdate();
            System.out.print("TC3: send_message('user1','p12344') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}
            

            cstmt1.setString(2,"user1ssssssssssssssssssssssssssssssssss");
            cstmt1.setString(3,"p1234");
            cstmt1.executeUpdate();
            System.out.print("TC5: send_message('user1ssssssssssssssssssssssssssssssssss','p1234') очікуваний результат -1, результат:" + cstmt1.getInt(1));
            if(cstmt1.getInt(1) == -1) System.out.println("Passed");
            else{System.out.println("Failed");
                testcaseResult = -1;}


            con.close();
        }
        catch(Exception e){System.out.println(e);}
        System.exit(testcaseResult);
    }
}
