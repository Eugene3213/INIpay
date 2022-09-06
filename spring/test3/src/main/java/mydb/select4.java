package mydb;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class select4 {
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Resource(name="xmlJava")
	private xmljava xmljava;
	
	@RequestMapping("/user_delete.do")
	public String deletemb(String mid, String mpw, String mnm, Model m) {
		try {
			SqlSession delete = sqlFactory.openSession();
			String result2 =xmljava.deleteuser(mid,mpw,mnm);
			m.addAttribute("msg",result2);
			
		}catch(Exception e) {
			
		}
		return "view/deleteok";
	}
	
	//정보수정
	@RequestMapping("/member_update.do")
	public String updatemb(String mid, String mnm, String mpw, Model m) {
		try {
			SqlSession modify =sqlFactory.openSession();
			String result = xmljava.updateuser(mid, mpw, mnm);
			m.addAttribute("msg",result);
			
		}catch(Exception e) {
			
		}
		return "view/insertok";
	}
	
	@RequestMapping("/select5.do")
	public String insertmb(Model m,String mid, String mpw, String mnm, String mage) {
		//System.out.println(mid);
		try {
			SqlSession session =sqlFactory.openSession();
			String call = xmljava.userinsert(mid, mpw, mnm,mage);
			
		}catch(Exception e) {
			
		}
		return "view/insertok";
	}
	@RequestMapping("/select4.do")
	public String homepage(Model m) {
		try {
			SqlSession session = sqlFactory.openSession();
//			List<userVO> datas = xmljava.selectall();
//			System.out.println(datas.size() + "명 입니다.");
			
//			userVO uv = xmljava.selectid("hong");
//			System.out.println("사용자 이름:" + uv.getMname()+ "사용자 아이디:" + uv.getMid());
			
			int age =30;
			List<userVO> datas2 = xmljava.selectage(age);
			m.addAttribute("list",datas2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "view/select4";
	}
}
