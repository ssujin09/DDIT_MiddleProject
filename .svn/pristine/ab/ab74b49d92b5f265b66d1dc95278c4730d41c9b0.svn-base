package admin.service;

public class Paging {
	
	 public int w_size =0; // 한 페이지에 보여줄 글 개수
	 public int p_size = 5;  // 페이지 개수
	 public int writing_Count = 0; // 총 글 갯수
	 
	 public int cur_Page = 0; // 현재페이지
	 
	 
	 public Paging( int w_size, int writing_Count,  int cur_Page) {
	  super();
	  this.w_size=w_size;
	  this.writing_Count = writing_Count;
	  this.cur_Page = cur_Page;
	 }
	 
	 //총 페이지 개수 
	 public int getPage_Count()
	 {
	  return ( (writing_Count - 1) / w_size) + 1;
	 }
	 
	 //페이지 시작 숫자
	 public int getPage_Start()
	 {
	  return ( ( cur_Page - 1 ) / p_size ) * p_size + 1;
	 }
	 
	 //페이지 마지막 숫자
	 public int getPage_End()
	 {
	  return Math.min( getPage_Start() + p_size - 1 , getPage_Count() );
	 }
	 
	 //Pre 표시 여부 
	 public boolean isPre()
	 {
	  return getPage_Start() != 1;
	 }
	 
	 //Next 표시 여부
	 public boolean isNext()
	 {
	  return getPage_End() < getPage_Count();
	 }
	 
	 //글 범위 시작 번호
	 public int getStartIdx()
	 {
	  return (cur_Page-1)*w_size;
	 }
	 
	 //글 범위 끝 번호
	 public int getEndIdx()
	 {
	  return Math.min(getStartIdx() + w_size, writing_Count);
	 }
}
