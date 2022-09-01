package test3;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class exam {

	@RequestMapping("examupload.do")
	public String upload(Model m, MultipartFile exam1, HttpServletRequest req) throws Exception{
	
		String dictory="c:\\fileupload\\";
		File fi = new File(dictory);
		
		return "view/exam";
	}
}
