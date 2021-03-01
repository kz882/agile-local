package toy;

import java.io.InputStream;

public class MainClass {
	public static void main(String[] args) {
		String sampleGetRequest = 
		        "GET /a/b/hello.htm?q=x&v=12%200 HTTP/1.1\r\n" +
		        "User-Agent: Mozilla/4.0 (compatible; MSIE5.01; Windows NT)\r\n" +
		        "Host: www.cis.upenn.edu\r\n" +
		        "Accept-Language: en-us\r\n" +
		        "Accept-Encoding: gzip, deflate\r\n" +
		        "Cookie: name1=value1; name2=value2; name3=value3\r\n" +
		        "Connection: Keep-Alive\r\n\r\n";
		
		HttpParsing.parseRequest("0.0.0.0", null, null, null)
	}
}
