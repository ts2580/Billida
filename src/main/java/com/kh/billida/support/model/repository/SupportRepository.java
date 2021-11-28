package com.kh.billida.support.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.billida.common.paging.Paging;
import com.kh.billida.support.model.dto.Support;

@Mapper
public interface SupportRepository {

	@Insert
	("insert into report_board(REPORT_IDX, USER_ID, REPORT_TITLE, REPORT_CONTENT, REPORT_DATE, REPORT_RESULT)"
	+ " values(REPORT_IDX.nextval, #{userId}, #{reportTitle}, #{reportContent}, #{reportDate}, '0')")
	void reportInsertPost(Map<String, Object> commandMap);

	@Select("select * from(select /*+INDEX_DESC(report_board) */ rownum as rb, r.report_idx, r.user_id, r.report_title, r.report_content, r.report_date, r.report_result"
			+ " from report_board r where rownum <= #{pageNum} * #{amount} order by report_idx desc )"
			+ "	where rb > (#{pageNum} -1) * #{amount}")
	List<Map<String, Object>> getSupportListPaging(Map<String, Object> reportList);

	@Select("select * from report_board where REPORT_IDX = #{reportIdx}")
	Support reportDetailPage(String reportIdx);
	
	@Select("select count(*)report_idx from report_board")
	int getSupportTotal();
	
	
	@Select("select * from report_board order by report_idx desc")
	List<Map<String, Object>> getReportList(Map<String, Object> reportListMap);

	@Select("select * from ( select rownum rn, A.* from( select * from report_board order by report_idx desc) A) where rn between #{startPage} and #{endPage}")
	List<Support> selectPage(Paging paging);

}
