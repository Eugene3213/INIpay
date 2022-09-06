package mydb;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//xml + controller + module
@Repository("xmlJava")		//repository: 해당 메소드 모두를 시스템 메모리 저장소에 기억시킴
public class xmljava {
	
	//@autowired: 특정값을 입력 받아 처리가 가능한 template이며
	//@resource: 전체에 대한 template으로 이용
	@Resource(name="SqlSessionTemplate")
	private SqlSessionTemplate session;		//sql문법을 실행하기 위한 변수세팅
	//※ xml에서 사용하는 id값이 중복 또는 오타가 발생할 경우 연결 되지 않음
	//selectList: 여러개의 데이터를 가져올 때
	//selectOne: 한개의 데이터만 가져올 때
	
	//사용자 전체 리스트
	public List<userVO> selectall(){
		List<userVO> userlist = session.selectList("userDB.selectall");
			return userlist;
	}
	
	//사용자에 대한 정보만 출력
	public userVO selectid(String id) {
		userVO user = session.selectOne("userDB.selectid", id);
		System.out.println(user);
			return user;
	}
	
	//사용자에 대한 나이에 해당되는 범위만 출력
	public List<userVO> selectage(int age) {
		//값을 보낼 경우 selectList("연결 id",전송할 값)
		List<userVO> userlist = session.selectList("userDB.selectage",age);
			return userlist;
	}
	
	//사용자값 입력 파트
	public String userinsert(String mid, String mpw, String mnm, String mage) {
		//getter,setter를 DTO 상태에서 로드하며 mapper
		userVO vo = new userVO();
		vo.setMid(mid);
		vo.setMpw(mpw);
		vo.setMnm(mnm);
		vo.setMage(mage);
		//System.out.println(vo);
		session.insert("userDB.userinsert",vo);
		String sign = "ok";
			return sign;
	}
	
	public String updateuser(String mid, String mpw, String mnm) {
		userVO vo =new userVO();
		vo.setMid(mid);
		vo.setMpw(mpw);
		vo.setMnm(mnm);
		//session = null (데이터 수정 실패)
		session.update("userDB.userupdate", vo);
		String sign ="ok";
			return sign;
	}
	
	public String deleteuser(String mid, String mpw, String mnm) {
		userVO vo = new userVO();
		vo.setMid(mid);
		vo.setMpw(mpw);
		vo.setMnm(mnm);
		session.delete("userDB.user_delete", vo);
		String sign = "ok";
			return sign;
	}
	//session.selectOne: 한개의 데이터
	//session.selectList: 여러개의 데이터
	//session.insert: 입력파트
	//session.update: 수정파트
	//session.delete: 삭제파트
	//session.selectMap: Object 데이터 입력을 사용함
}
