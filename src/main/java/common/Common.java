package common;

public class Common {
	public static final String LOGIN_VIEW_PATH="WEB-INF/views/login_join/";//요거 /까먹지 말기 
	
	public static final String BOARD_VIEW_PATH="WEB-INF/views/board/";
	public static final String VIEW_PATH="WEB-INF/views/";//요거 /까먹지 말기 
	public static final String MAIN_VIEW_PATH="WEB-INF/views/main/" ;
	public static final String CART_VIEW_PATH="WEB-INF/views/cart/" ;
	public static final String BOOK_VIEW_PATH="WEB-INF/views/book/" ;
	
	//일반 게시판
			public static class Board{//바로바로 접근하기 위해 static을 이용해 만듬. EX)Common.Board.BLOCKLIST
				// 한페이지당 보여줄 게시물 수
				public final static int BLOCKLIST=5;
				
				//한 화면에 보여지는 페이지 메뉴 수
				//◀ 1 2 3 4 5 ▶
				public final static int BLOCKPAGE=5;
			}
			
			//공지사항 게시판
			public static class Notice{
				public final static int BLOCKLIST=5;
				public final static int BLOCKPAGE=3; 
			}
}
