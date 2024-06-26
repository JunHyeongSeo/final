package com.kh.hondimoyeong.member.model.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hondimoyeong.cs.model.vo.Customer;
import com.kh.hondimoyeong.experience.model.vo.Experience;
import com.kh.hondimoyeong.member.model.vo.Member;

@Repository
public class MemberRepository {
	

   public Member login(SqlSessionTemplate sqlSession, Member member) {
      return sqlSession.selectOne("memberMapper.login", member);
   }

	public int insert(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insert", member);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
    public int emailCheck(SqlSessionTemplate sqlSession, String email) {
        return sqlSession.selectOne("memberMapper.emailCheck", email);
    }

    public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
        return sqlSession.selectOne("memberMapper.phoneCheck", phone);
    }
	
	public int update(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.update", member);
	}
	
	public int delete(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.delete", member);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, String category, String keyword, int userNo) {
		if(category.equals("0")) {
			category = "%";
		}
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("category", category);
	    params.put("keyword", keyword);
	    params.put("userNo", userNo);
		return sqlSession.selectOne("customerMapper.selectListCount", params); 
	}	

	public List<Customer> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds, String category, String keyword, int userNo) {
		if(category.equals("0")) {
			category = "%";
		}
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("category", category);
	    params.put("keyword", keyword);
	    params.put("userNo", userNo);
		return sqlSession.selectList("customerMapper.selectList", params, rowBounds);
	}
	
	public int insertCustomer(SqlSessionTemplate sqlSession, Customer customer) {
		return sqlSession.insert("customerMapper.insertCustomer", customer);
	}

	public Customer selectCustomerByNo(SqlSessionTemplate sqlSession, int customerNo) {
		return sqlSession.selectOne("customerMapper.selectCustomerByNo", customerNo);
	}

	public int reservationSelectListCount(SqlSessionTemplate sqlSession, int userNo) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("userNo", userNo);
	    return sqlSession.selectOne("experienceMapper.reservationSelectListCount", params); 
	}

	public List<Experience> reservationSelectList(SqlSessionTemplate sqlSession, RowBounds rowBounds, int userNo) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("userNo", userNo);
	    return sqlSession.selectList("experienceMapper.reservationSelectList", params, rowBounds);
	}
	
	
	public int updateCustomer(SqlSessionTemplate sqlSession, Customer customer) {
		return sqlSession.update("customerMapper.updateCustomer", customer);
	}
	
	
    public int deleteCustomer(SqlSessionTemplate sqlSession, int customerNo) {
	       return sqlSession.delete("customerMapper.deleteCustomer", customerNo);
	}

	
    public String findId(SqlSessionTemplate sqlSession, String userName, String phone, String email) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userName", userName);
        params.put("phone", phone);
        params.put("email", email);
        return sqlSession.selectOne("memberMapper.findId", params);
    }
	
    public int updatePwd(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.update("memberMapper.updatePwd", member);
    }
	
    public int findPwd(SqlSessionTemplate sqlSession, String userId, String userName, String email) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", userId);
        params.put("userName", userName);
        params.put("email", email);
        
        Integer result = sqlSession.selectOne("memberMapper.findPwd", params);
        if (result == null) {
            return 0; 
        }
        return result;
    }
    
	
	
	
	
	
	
	
	


}