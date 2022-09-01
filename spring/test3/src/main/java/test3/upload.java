package test3;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class upload {

	@RequestMapping("fileupload.do")
	//Exception 파일업로드: 바이너리파일 Exception
	public String filesok(Model m, MultipartFile file1, HttpServletRequest req) throws Exception {
		//로컬로 파일 업로드
		String dictory = "c:\\upload\\";
		File fe = new File(dictory);	//
		if(!fe.exists()) {
			fe.mkdir();
		}
		else {
			if(!file1.equals("")) {
				String filename = file1.getOriginalFilename();	//사용자가 업로드 하는 파일명을 알아오는 부분
				String url ="";	//저장할 상대 경로				
			}
		}
		String url="";
		String filename="";
		if(filename.equals("")) {
			url="첨부파일은 없습니다";
		}
		else {
			url = dictory + filename;
			FileCopyUtils.copy(file1.getBytes(), new File(url));
			//FileCopyUtils.copy: ajax, (form)post 둘 다 사용이 가능
			//파일 복사 기능을 말하며, write + stream을 합친 형태로 인식을 함
			m.addAttribute("result_file",url);
		}
				
		return "view/okfile";
	}
	
	/*서버에 직접적으로 등록하는 방식*/
	@RequestMapping("/fileupload2.do")
	public String server_upload(Model m, MultipartFile file2, HttpServletRequest req) throws Exception{
		
		if(!file2.equals("")) {	//첨부파일에 파일이 등록 되었을 경우
			String filetype = file2.getContentType();	//업로드할 파일 type을 확인 하는 사항
			System.out.println(filetype);
			if(filetype.equals("image/jpeg")|| !filetype.equals("image/png") || !filetype.equals("image/txt")){
				System.out.println("해당 업로드는 이미지만 가능합니다");
			}
			
			//req.getServletContext().getRealPath(""): 서버 상대경로
			String dictory = req.getServletContext().getRealPath("");	//req.getServletContext().getRealPath(""): 서버 상대경로
			String upload_dictory = dictory + "upload/";	//상대경로 upload
			File fe = new File(upload_dictory);
			if(!fe.exists()) {
				fe.mkdir();
			}
			String filename = file2.getOriginalFilename(); 
			String copyfile = upload_dictory + filename;
			FileCopyUtils.copy(file2.getBytes(), new File(copyfile));
			m.addAttribute("result",copyfile);
		}
		else {
			m.addAttribute("result","첨부파일이 없습니다.");
		}
		return "view/okfile";
	}
}


