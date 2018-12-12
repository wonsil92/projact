package com.UTC.dto;

//게시판 페이징 설정을 해주는 클래스
public class Paging {
	private int totalcount; //전체 게시물의 개수
	private int countlist;
	private int pagenum; //첫페이지를 표시하기 위해 선언 페이지 번
	private int contentnum=10; //한페이지에 몇개 보일지
	private int startPage=1; //시작페이지(기본값1)
	private int endPage=5; //마지막 페이지(기본값 5)
	private boolean prev=false; //이전 페이지로 이동
	private boolean next; //다음 페이지로 이동
	private int currentblock=1;
	private int lastblock;
	
	
	//전체 페이지 블록이 몇 페이지까지 있는지 계산하는 메소드
	public int calcpage(int totalcount,int contentnum) {
		int totalpage = totalcount/contentnum;
		if(totalcount % contentnum > 0) {
			totalpage++;
		}
		if(totalpage<this.pagenum) {
			this.pagenum = totalpage;
		}
		return totalpage; //페이지 개수 리턴
	}
	//////dssadsdasd
	//이전페이지
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	//다음페이지
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	//시작페이지
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = (currentblock*10)-9;
		/*
		 한 페이지에 10개씩 보여주고
		 현재 페이지 블록 * 페이지개수(10) - 9로
		 시작 페이지 번호를 1로 지정
		 */
	}
	
	//마지막페이지
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int getlastblock, int getcurrentblock) {
		if(getlastblock==getcurrentblock) {
			this.endPage = calcpage(getTotalcount(),getContentnum());
		}else {
			this.endPage = getStartPage()+9;
		}
		//마지막 페이지 : 시작 페이지 +9 =10페이지
		//조건 마지막 페이지 블록이면 마지막 페이지 번호
	}
	
	public int getCurrentblock() {
		return currentblock;
	}
	
	//현재 페이지 블록의 번호가 몇번인지 저장해주는 메소드
	//페이지 번호 / 페이지 그룹 안의 페이지 개수(10)
	//->10페이지 전까지 +1
	public void setCurrentblock(int pagenum) {
		
		this.currentblock = pagenum/10;
		if(pagenum%10>0) {
			this.currentblock++;
		}
	}
	
	public int getLastblock() {
		return lastblock;
	}
	//마지막 페이지 블록의 번호가 몇번인지 지정해주는 메소드
	public void setLastblock(int totalcount) {
		//전체 글 개수를 사용해서 지정해줌
		this.lastblock = totalcount / (10*this.contentnum);
		if(totalcount%(10*this.contentnum)>0) {
			this.lastblock++;
		}
	}
	
	public int getTotalcount() {
		return totalcount;
	}
	
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	
	public int getCountlist() {
		return countlist;
	}
	public void setCountlist(int countlist) {
		this.countlist = countlist;
	}
	
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getContentnum() {
		return contentnum;
	}
	public void setContentnum(int contentnum) {
		this.contentnum = contentnum;
	}
}
