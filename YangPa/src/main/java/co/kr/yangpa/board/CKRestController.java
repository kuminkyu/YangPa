package co.kr.yangpa.board;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@RestController
public class CKRestController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(CKRestController.class);

	@RequestMapping(value = "/ckfileup" ,method = RequestMethod.POST)
	public JsonObject ckFileUp(MultipartFile upload) throws IOException {

		System.out.println("들어옴");
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String nal = nalja.format(today);
		String si = sigan.format(today);
		
		String fileNm = upload.getOriginalFilename();
		System.out.println(fileNm);
		String tmpFront = fileNm.substring(0,fileNm.lastIndexOf("."));
		String tmpBack = fileNm.substring(fileNm.lastIndexOf("."));
		
		fileNm = tmpFront + "_" + nal + "_" + si+ tmpBack;
		
		String path = "C:/upload/yangpa/";
		InputStream in = upload.getInputStream();
		OutputStream out = new FileOutputStream(path + fileNm);
		FileCopyUtils.copy(in, out);
		
		in.close();
		out.close();
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("uploaded", 1);
		jsonObj.addProperty("fileName", fileNm);
		jsonObj.addProperty("url", "/yangpa/ckimg/"+fileNm);
		
		return jsonObj;
	}//ckFileUp

}//class