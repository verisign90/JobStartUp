package com.pickmeup.jobstartup.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagination {
    // 전체 데이터 개수
    private int totalRecordCount;
    // 전체 페이지 개수
    private int totalPageCount;
    // 페이지 리스트의 첫 페이지 번호
    private int firstPage;
    // 페이지 리스트의 마지막 페이지 번호
    private int lastPage;
    // SQL의 조건절에 사용되는 첫 RNUM
    private int firstRecordIndex;
    // SQL의 조건절에 사용되는 마지막 RNUM
    private int lastRecordIndex;
    // 이전 페이지 존재 여부
    private boolean hasPreviousPage;
    // 다음 페이지 존재 여부
    private boolean hasNextPage;

    public Pagination (int totalRecordCount, Criteria criteria) {
        this.totalRecordCount = totalRecordCount;
        if (totalRecordCount > 0) {
            calculation(criteria);
        }
    }


    private void calculation(Criteria criteria) {
        // 전체 페이지 수 (현재 페이지 번호가 전체 페이지 수보다 크면 현재 페이지 번호에 전체 페이지 수를 저장)
        totalPageCount = ((totalRecordCount - 1) / criteria.getRecordsPerPage())+ 1 ;
        if (criteria.getCurrentPageNo() > totalPageCount) {
            criteria.setCurrentPageNo(totalPageCount);
        }

        // 페이지 리스트의 첫 페이지 번호
        firstPage = ((criteria.getCurrentPageNo() - 1) / criteria.getPageSize()) * criteria.getPageSize() + 1;

        // 페이지 리스트의 마지막 페이지 번호 (마지막 페이지가 전체 페이지 수보다 크면 마지막 페이지에 전체 페이지 수를 저장)
        lastPage = firstPage + criteria.getPageSize() - 1;
        if (lastPage > totalPageCount) {
            lastPage = totalPageCount;
        }

        // SQL의 조건절에 사용되는 첫 RNUM
        firstRecordIndex = (criteria.getCurrentPageNo() - 1) * criteria.getRecordsPerPage();

        // SQL의 조건절에 사용되는 마지막 RNUM
        lastRecordIndex = criteria.getCurrentPageNo() * criteria.getRecordsPerPage();

        // 이전 페이지 존재 여부
        hasPreviousPage = firstPage == 1 ? false : true;
        if(hasPreviousPage == false) {
            if(criteria.getCurrentPageNo() != firstPage) {
                hasPreviousPage = true;
            }else {
                hasPreviousPage = false;
            }
        }

        // 다음 페이지 존재 여부
        hasNextPage = (lastPage * criteria.getRecordsPerPage()) >= totalRecordCount ? false : true;
        if(hasNextPage == false) {
            //마지막 페이지에서 현재페이지가 마지막 페이지가 아닌경우 next처리
            if(criteria.getCurrentPageNo() != lastPage) {
                hasNextPage = true;
            }else {
                hasNextPage = false;
            }
        }
    }
}
