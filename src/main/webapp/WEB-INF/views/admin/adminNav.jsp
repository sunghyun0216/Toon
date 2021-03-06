<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 시큐리티 적용하기-->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <!-- Start nav --> 
  <div class="sidebar">
        <div class="user-profile">
          <div class="display-avatar animated-avatar">
           
          </div>
          <div class="info-wrapper">
            <div class="display-avatar animated-avatar">
            <c:if test="${memberVO.joinFileVO.fileName eq null}"><img id="image" width=180px height=200px alt="" src="../images/member.jpg"></c:if>
			<c:if test="${memberVO.joinFileVO.fileName ne null}"><img id="image" width=180px height=200px alt="" src="../upload/member/${memberVO.joinFileVO.fileName}"></c:if>
          </div>
            <h6 class="display-income">ADMIN</h6>
          </div>
        </div>
        
        <ul class="navigation-menu">
          
          <li class="nav-category-divider">Management</li>
          <!-- 작품관리  -->
          <li>
            <a href="#select_toon" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">작품관리</span>
              <i class="mdi mdi-flask2 link-icon"></i>
            </a>
            
            <ul class="collapse navigation-submenu" id="select_toon">
              <li>
                <a href="${pageContext.request.contextPath}/admin/manageToonList">작품 조회</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/admin/manageToonInsert">작품 등록</a>
              </li>
              
               <li>
                <a href="${pageContext.request.contextPath}/admin/manageEachEpList">회차 조회</a>
              </li>
              
               <li>
                <a href="${pageContext.request.contextPath}/admin/manageEachEpInsert">회차 등록</a>
              </li>
            </ul>
          </li>
          
          <li>
            <a href="#sales_inquiry" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">매출관리</span>
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
             <ul class="collapse navigation-submenu" id="sales_inquiry">
              <li>
                <a href="${pageContext.request.contextPath}/sales/income">한눈에 보기</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/sales/toonsIncome">웹툰 별 매출조회</a>
              </li>
            </ul>
          </li>
          
     
          <!-- 새로운 각주  -->
          <li>
            <a href="#notice_qna" data-toggle="collapse" aria-expanded="false">
              <span class="link-title">공지사항,질의응답 관리</span>
              <i class="mdi mdi-chart-donut link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="notice_qna">
              <li>
                <a href="${pageContext.request.contextPath}/admin/manageNoticeList">공지사항</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/admin/manageQnaList">질의응답</a>
              </li>
            </ul>
          </li>
        </ul>
 </div>
 <!-- END nav -->