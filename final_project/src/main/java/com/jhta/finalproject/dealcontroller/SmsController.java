package com.jhta.finalproject.dealcontroller;

import java.io.IOException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
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

	@PostMapping("/deal/smssend")
	public String sendFrom(Model model, String action, String rphone, String sphone1, String sphone2,
			String sphone3, String rdate, String rtime, String subject, String testflag,
			String destination, String repeatFlag, String repeatNum, String repeatTime, String returnurl,
			String nointeractive) {
		try {
			String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; //필수
			String user_id = base64Encode("lamgul"); //필수
			String secure = base64Encode("6f15e3a9a71b3a4af0b5214088b8401d"); //필수
			String msg = ""; //필수
			rphone = "";  //필수
			sphone1 = "010";  //필수
			sphone2 = "8009";  //필수
			sphone3 = "2767";  //필수
			rdate = "";
			rtime = "";
			String mode = base64Encode("1");
			subject = "";
			testflag = "";  //테스트 요청시 Y
			destination = "";
			repeatFlag = "";
			repeatNum = "";
			repeatTime = "";
			returnurl = "";
			nointeractive = base64Encode(nullcheck(nointeractive, ""));
			String smsType = "S"; //필수
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
			valKey[3] = rphone;
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
			// out.println(data);
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
			System.out.println(nointeractive);
			System.out.println(alert);
			System.out.println(returnurl);

			
		} catch (IOException ie) {
			ie.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "deal/smssend";
	}

}
