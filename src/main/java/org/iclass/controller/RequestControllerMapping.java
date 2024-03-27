package org.iclass.controller;

import java.util.HashMap;
import java.util.Map;

import org.iclass.controller.api.ApiCheckIdController;
import org.iclass.controller.api.ApiEventImageUploadController;
import org.iclass.controller.api.ApiGetEventOneController;
import org.iclass.controller.api.ApiLikeController;
import org.iclass.controller.api.ApiUserJoinController;
import org.iclass.controller.buy.MyListController;
import org.iclass.controller.event.EventDeleteController;
import org.iclass.controller.event.EventListController;
import org.iclass.controller.event.EventSaveController;
import org.iclass.controller.event.EventUpdateController;
import org.iclass.controller.event.EventUpdateSaveController;
import org.iclass.controller.event.NewFormController;
import org.iclass.controller.menu.MenuListController;
import org.iclass.controller.notice.NoticeDeleteController;
import org.iclass.controller.notice.NoticeListController;
import org.iclass.controller.notice.NoticeReadController;
import org.iclass.controller.notice.NoticeUpdateController;
import org.iclass.controller.notice.NoticeUpdateSaveController;
import org.iclass.controller.notice.NoticeWriteController;
import org.iclass.controller.notice.NoticeWriteSaveController;
import org.iclass.controller.option.OptionListController;
import org.iclass.controller.pay.PayRequestFailController;
import org.iclass.controller.pay.PayRequestSuccessController;
import org.iclass.controller.user.LoginActionController;
import org.iclass.controller.user.LoginViewController;
import org.iclass.controller.user.LogoutController;
import org.iclass.controller.user.MyPageController;
import org.iclass.controller.user.UserJoinController;
import org.iclass.controller.user.UserModifyController;
import org.iclass.controller.user.UserSaveController;


public class RequestControllerMapping {
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init() {
		mapping.put(new RequestKeyValue("/notice/list", "GET"), new NoticeListController());
		mapping.put(new RequestKeyValue("/notice/read", "GET"), new NoticeReadController());
		mapping.put(new RequestKeyValue("/notice/write", "GET"), new NoticeWriteController());
		mapping.put(new RequestKeyValue("/notice/save", "POST"),new NoticeWriteSaveController());
		mapping.put(new RequestKeyValue("/notice/update", "GET"), new NoticeUpdateController());
		mapping.put(new RequestKeyValue("/notice/update", "POST"), new NoticeUpdateSaveController());
		mapping.put(new RequestKeyValue("/notice/delete", "GET"), new NoticeDeleteController());
//		mapping.put(new RequestKeyValue("/notice/download", "POST"), new NoticeFileDownloadController());
		
		//로그인 로그아웃
		mapping.put(new RequestKeyValue("/user/login", "GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/user/login", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/user/logout", "GET"), new LogoutController());
		//마이페이지
		mapping.put(new RequestKeyValue("/user/modify","GET"),new MyPageController());
		mapping.put(new RequestKeyValue("/user/modify","POST"),new UserModifyController());
		mapping.put(new RequestKeyValue("/buy/mylist","GET"),new MyListController());
		//회원가입
		mapping.put(new RequestKeyValue("/user/join","GET"), new UserJoinController());
		mapping.put(new RequestKeyValue("/user/join","POST"), new UserSaveController());
		mapping.put(new RequestKeyValue("/api/user/join", "POST"), new ApiUserJoinController());
		mapping.put(new RequestKeyValue("/api/auth/checkId", "POST"), new ApiCheckIdController());
		//구매 리스트
		mapping.put(new RequestKeyValue("/menu/list", "GET"), new MenuListController());
		mapping.put(new RequestKeyValue("/option/list", "GET"), new OptionListController());
		//성공 ,실패
		mapping.put(new RequestKeyValue("/pay/success","GET"), new PayRequestSuccessController());
		mapping.put(new RequestKeyValue("/pay/fail","GET"), new PayRequestFailController());
		mapping.put(new RequestKeyValue("/api/pay", "POST"), new ApiPaymentSaveController());
		
		mapping.put(new RequestKeyValue("/event/new", "GET"), new NewFormController());
		mapping.put(new RequestKeyValue("/event/new", "POST"), new EventSaveController());
		mapping.put(new RequestKeyValue("/event/upload", "POST"), new ApiEventImageUploadController());
		mapping.put(new RequestKeyValue("/event/event", "GET"), new EventListController());
		mapping.put(new RequestKeyValue("/event/delete", "GET"), new EventDeleteController());
		
		//이벤트 수정
		mapping.put(new RequestKeyValue("/event/update", "GET"), new EventUpdateController());
		mapping.put(new RequestKeyValue("/event/update", "POST"), new EventUpdateSaveController());
		
		mapping.put(new RequestKeyValue("/api/event", "GET"), new ApiGetEventOneController() );
		mapping.put(new RequestKeyValue("/api/like", "POST"), new ApiLikeController());
	}
	public static Controller getController(RequestKeyValue key) {
		return mapping.get(key);
	}
}
