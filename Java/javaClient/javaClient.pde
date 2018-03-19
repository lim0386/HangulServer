import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

  public static void main(String[] args) {
    // TODO Auto-generated method stub

    Socket s1;
    InputStream is1;
    DataInputStream is2;
    OutputStream os1;
    DataOutputStream os2;
    String inputstr;
    
    try {
      s1 = new Socket("192.168.0.101", 3000); //서버의 주소와 포트를 지정해줌.
      
      is1 = s1.getInputStream();
      is2 = new DataInputStream(is1);
      
      os1 = s1.getOutputStream();
      os2 = new DataOutputStream(os1);
      
      String str = is2.readUTF();
      System.out.println(str);
      Scanner scn = new Scanner(System.in); // 메시지를 입력받아 서버에 보냄
      inputstr = scn.nextLine();
      os2.writeUTF(inputstr);
      
      os1.close();
      os2.close();
      is2.close();
      is1.close();
      s1.close();
      
    } catch (ConnectException e) { //만약 연결에 관련한 예외(오류)가 있다면 아래 메시지를 출력
      // TODO Auto-generated catch block
      System.out.println("접속이 안 돼요!");
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }
