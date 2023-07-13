package test.com.moim.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.somoim.model.SomoimDAO;
import test.com.moim.somoim.model.SomoimVO;
import test.com.moim.userinfo.model.UserinfoDAO;
import test.com.moim.userinfo.model.UserinfoVO;

@Slf4j
@Service
public class MypageService {

	@Autowired
	UserinfoDAO dao;
	
	@Autowired
	SomoimDAO dao2;


	public UserinfoVO mypageSelectOne(UserinfoVO vo) {
		log.info("mypageSelectOne....{}", vo);
		return dao.mypageSelectOne(vo);
	}


	public List<SomoimVO> mypageSelectSomoim(String user_id) {
		log.info("mypageSelectSomoim...{}", user_id);
		return dao2.mypageSelectSomoim(user_id);
	}


	public int mypage_update(UserinfoVO vo) {
		log.info("update.....{}", vo);
		return dao.mypage_update(vo);
	}


}
