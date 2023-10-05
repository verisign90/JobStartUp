package com.pickmeup.jobstartup.config;

import com.pickmeup.jobstartup.entity.MemberType;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedJdbcTypes(JdbcType.VARCHAR)
@MappedTypes(MemberType.class)
public class MemberTypeHandler extends BaseTypeHandler<MemberType> {
    //MemberType을 해당 코드 문자열로 변환(COMMON -> "1")
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, MemberType parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getCode());
    }

    //데이터베이스 컬럼 이름-> MemberType으로 변환
    @Override
    public MemberType getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String code = rs.getString(columnName);
        return code == null ? null : MemberType.valueOfCode(code);
    }

    //데이터베이스 컬럼 인덱스-> MemberType으로 변환
    @Override
    public MemberType getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String code = rs.getString(columnIndex);
        return code == null ? null : MemberType.valueOfCode(code);
    }

    //SQL 저장 프로시저 -> MemberType으로 변환
    @Override
    public MemberType getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String code = cs.getString(columnIndex);
        return code == null ? null : MemberType.valueOfCode(code);
    }
}
