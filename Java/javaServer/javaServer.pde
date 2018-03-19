import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;


//public class TCPServer {

  public static void main(String[] args) {
    ServerSocket s1 = null;
    Socket s2;
    OutputStream os1;
    DataOutputStream os2;
    InputStream is1;
    DataInputStream is2;
    
    try {
      s1 = new ServerSocket(3000); //5432번으로 서버 소켓을 생성
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    while (true) {
      try {

        System.out.println("접속 대기중....");
        s2 = s1.accept(); //접속을 허용
        System.out.println("클라이언트 접속 성공!");
                                //접속되면 이와 같은 메시지를 띄움. 실패시 catch로 넘어가기 때문에 성공시만 나옴.  
        
        os1 = s2.getOutputStream();
        os2 = new DataOutputStream(os1);
        os2.writeUTF("서버에 접속하신것을 환영합니다!");
        //소켓으로부터 OutputStream을 위임받은 뒤 
                                //DataOuptutStream을 통해 Data를 보낼 스트림을 만듬
        is1 = s2.getInputStream();
        is2 = new DataInputStream(is1);
        System.out.println(is2.readUTF());
        //클라이언트가 보낸 메시지를 읽는 부분. 마찬가지로 소켓으로부터
                                //inputstream을 위임받고 DataInputStream을 통해 Data를 받을 스트림을 만듬.
        
        is1.close(); // 모두 종료해줌
        is2.close();
        os2.close();
        os1.close();
        s2.close();
        
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
    
  }
//}
