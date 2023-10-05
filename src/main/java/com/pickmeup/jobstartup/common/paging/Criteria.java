package com.pickmeup.jobstartup.common.paging;

import lombok.Getter;
import lombok.Setter;

//공통 페이징 처리
@Getter
@Setter
public class Criteria {

    //현재 페이지 번호
    private int currentPageNo;

    //페이지당 출력할 데이터 개수
    private int recordsPerPage;

    //화면 하단에 출력할 페이지 사이즈
    private int pageSize;

    //category 유형
    private String category;

    //검색 키워드
    private String keyword;

    //검색 유형
    private String searchType;

    //페이지네이션 정보
    private Pagination pagination;

    public Criteria() {
        this.currentPageNo = 1;
        this.recordsPerPage = 10;
        this.pageSize = 10;
    }

    public int getStartPage() {
        return (currentPageNo - 1) * recordsPerPage;
    }

}
