package test.com.moim.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.moim.userinfo.model.UserinfoDAO;
import test.com.moim.userinfo.model.UserinfoVO;

@Slf4j
@Service
public class MypageService {

	@Autowired
	UserinfoDAO dao;

	public UserinfoVO mypageSelectOne(UserinfoVO vo) {
		log.info("mypageSelectOne....{}", vo);
		return dao.mypageSelectOne(vo);
	}

}