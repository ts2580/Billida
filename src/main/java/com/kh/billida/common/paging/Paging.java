package com.kh.billida.common.paging;

import lombok.Data;

@Data
public class Paging {
	
	private int startPage; //시작 페이지(시작 번호)
	private int endPage; //끝 페이지(끝 번호)
	private boolean prev; //이전 페이지 존재유무
	private boolean next; //다음 페이지 존재유무
	private int total; //전체 게시물 수
	private Criteria cri; //현재 페이지, 페이지당 게시물 표시수 정보

    public Paging(Criteria cri, int total) { 
        this.cri = cri;
        this.total = total;
        
        this.endPage = (int)(Math.ceil(cri.getPageNum()/5.0))*5; // 마지막 페이지 : 페이지 블록에 들어갈 페이지 갯수만큼 나누고 곱합
        this.startPage = this.endPage - 4; //시작 페이지
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount())); //전체 마지막 페이지
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
    
        this.prev = this.startPage > 1; //시작 페이지(startPage)값이 1보다 큰 경우 true
        this.next = this.endPage < realEnd; //마지막 페이지(endPage)값이 1보다 큰 경우 true
        
        
    }
    
    
}
