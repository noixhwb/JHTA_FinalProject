package com.jhta.finalproject.dealcontroller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.HashMap;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class SmsController {

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}

	public static String base64Encode(String str) throws java.io.IOException {
		Encoder encoder = Base64.getEncoder();
		String result = new String(encoder.encode(str.getBytes()));
		return result;
	}

	public static String base64Decode(String str) throws java.io.IOException {
		Decoder decoder = Base64.getDecoder();
		// byte[] strByte = decoder.decodeBuffer(str);
		String result = new String(decoder.decode(str.getBytes()));
		return result;
	}
	
	@PostMapping(value="/deal/smssend",produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> sendFrom(Model model, String rphone) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		try {
			int aa = (int)(Math.random()*10000);
			
			String code="인증번호: "+Integer.toString(aa);
			String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; //필수
			String user_id = base64Encode("lamgul"); //필수
			String secure = base64Encode("6f15e3a9a71b3a4af0b5214088b8401d"); //필수
			String msg = base64Encode(code); //필수
			//rphone 필수 보내줘야함
			String sphone1 = base64Encode("010");  //필수
			String sphone2 = base64Encode("8009");  //필수
			String sphone3 = base64Encode("2767");  //필수
			String rdate = base64Encode("");
			String rtime = base64Encode("");
			String mode = base64Encode("1");
			String subject = base64Encode("");
			String testflag = base64Encode("");  //테스트 요청시 Y
			String destination = base64Encode("");
			String repeatFlag = base64Encode("");
			String repeatNum = base64Encode("");
			String repeatTime = base64Encode("");
			String returnurl = base64Encode("");
			String smsType = base64Encode("S"); //필수
			String[] host_info = sms_url.split("/");
			String host = host_info[2];
			String path = "/" + host_info[3];
			int port = 80;

			String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3",
					"rdate", "rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime",
					"smsType", "subject" };
			String valKey[] = new String[arrKey.length];
			valKey[0] = user_id;
			valKey[1] = secure;
			valKey[2] = msg;
			valKey[3] = base64Encode(rphone);
			valKey[4] = sphone1;
			valKey[5] = sphone2;
			valKey[6] = sphone3;
			valKey[7] = rdate;
			valKey[8] = rtime;
			valKey[9] = mode;
			valKey[10] = testflag;
			valKey[11] = destination;
			valKey[12] = repeatFlag;
			valKey[13] = repeatNum;
			valKey[14] = repeatTime;
			valKey[15] = smsType;
			valKey[16] = subject;

			String boundary = "";
			java.util.Random rnd = new java.util.Random();
			String rndKey = Integer.toString(rnd.nextInt(32000));
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] bytData = rndKey.getBytes();
			md.update(bytData);
			byte[] digest = md.digest();
			for (int i = 0; i < digest.length; i++) {
				boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
			}
			boundary = "---------------------" + boundary.substring(0, 11);
			String data = "";
			String index = "";
			String value = "";
			for (int i = 0; i < arrKey.length; i++) {
				index = arrKey[i];
				value = valKey[i];
				data += "--" + boundary + "\r\n";
				data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
				data += "\r\n" + value + "\r\n";
				data += "--" + boundary + "\r\n";
			}
			System.out.println(data);
			java.net.InetAddress addr = java.net.InetAddress.getByName(host);
			java.net.Socket socket = new java.net.Socket(host, port);
			java.io.BufferedWriter wr = new java.io.BufferedWriter(
					new java.io.OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
			wr.write("POST " + path + " HTTP/1.0\r\n");
			wr.write("Content-Length: " + data.length() + "\r\n");
			wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
			wr.write("\r\n");

			// 데이터 전송
			wr.write(data);
			wr.flush();

			// 결과값 얻기
			java.io.BufferedReader rd = new java.io.BufferedReader(
					new java.io.InputStreamReader(socket.getInputStream(), "UTF-8"));
			String line;
			String alert = "";
			java.util.ArrayList<String> tmpArr = new java.util.ArrayList<String>();
			while ((line = rd.readLine()) != null) {
				tmpArr.add(line);
			}
			wr.close();
			rd.close();
			String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
			String[] rMsg = tmpMsg.split(",");
			String Result = rMsg[0]; // 발송결과
			String Count = ""; // 잔여건수
			if (rMsg.length > 1) {
				Count = rMsg[1];
			}
			// 발송결과 알림
			if (Result.equals("success")) {
				alert = "성공적으로 발송하였습니다.";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("reserved")) {
				alert = "성공적으로 예약되었습니다";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("3205")) {
				alert = "잘못된 번호형식입니다.";
			} else {
				alert = "[Error]" + Result;
			}
			
			System.out.println(alert);
			System.out.println(returnurl);
			
			map.put("code",aa);
			
		} catch (IOException ie) {
			ie.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(map);
		
		return map;
	}
	
	@PostMapping(value="/deal/calljson",produces = {MediaType.APPLICATION_JSON_VALUE})
	public String calljson(Model model) {
		 try {
	           String apiUrl =  "https://sslsms.cafe24.com/smsSenderPhone.php";
	            String userAgent = "Mozilla/5.0";
	            String postParams = "userId=lamgul&passwd=6f15e3a9a71b3a4af0b5214088b8401d";
	            URL obj = new URL(apiUrl);
	            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("User-Agent", userAgent);

	            // For POST only - START
	            con.setDoOutput(true);
	            OutputStream os = con.getOutputStream();
	            os.write(postParams.getBytes());
	            os.flush();
	            os.close();
	            // For POST only - END

	            int responseCode = con.getResponseCode();
	            System.out.println("POST Response Code :: " + responseCode);

	            if (responseCode == HttpURLConnection.HTTP_OK) { //success
	                BufferedReader in = new BufferedReader(new InputStreamReader(
	                        con.getInputStream()));
	                String inputLine;
	                StringBuffer buf = new StringBuffer();

	                while ((inputLine = in.readLine()) != null) {
	                    buf.append(inputLine);
	                }
	                in.close();
	                System.out.println(buf.toString());
	                return buf.toString();
	            } else {
	            	System.out.println("POST request not worked");
	            	return "POST request not worked";
	            }
	    } catch(IOException ex){
	    	return "error";
	    }
	}

}
