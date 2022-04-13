<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%System.out.println("<<<<< listProduct.jsp ���� >>>>>");%>
 <%-- 
<%@page import="java.util.List"%> 

<%@page import="com.model2.mvc.service.domain.Product"%>
<%@page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@page import="java.util.Map"%>
<%System.out.println("<<<<< listProduct.jsp ���� >>>>>");%>

	List<Product> list= (List<Product>)request.getAttribute("list");
	System.out.println("���� list: "+list);
	
	Page resultPage=(Page)request.getAttribute("resultPage");	
	System.out.println("���� resultPage: "+resultPage);
	
	Search search = (Search)request.getAttribute("search");
	System.out.println("���� search : " + search);
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	System.out.println("���� searchCondition: "+ searchCondition);
	System.out.println("���� searchKeyword: "+ searchKeyword);
	
	String menu = (String)request.getAttribute("menu");
	System.out.println("���� menu : " + menu);
	
	
--%>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetProductList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=${param.menu}" method="post">


<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						
						<c:if test="${param.menu eq 'manage'}" >
							��ǰ ����
						</c:if>
						<c:if test="${param.menu eq 'search'}" >
							��ǰ �����ȸ
						</c:if>
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input 	type="text" name="searchKeyword" 
						value="${search.searchKeyword}"
						class="ct_input_g" style="width:200px; height:20px" >
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('${resultPage.currentPage}');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
		<td></td>
		<td align="left">
				<a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>	
		</td>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<c:if test="${param.menu eq 'manage'}">
		<td align="left">
					<c:choose>
						<c:when test="${product.proTranCode eq '001'}">
						���ſϷ� <a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=002">����ϱ�</a>
						</c:when>
						<c:when test="${product.proTranCode eq '002'}">
						�����
						</c:when>
						<c:when test="${product.proTranCode eq '003'}">
						���� Ȯ�ιٶ�
						</c:when>
						<c:otherwise>
							�Ǹ���
						</c:otherwise>
					</c:choose>
					</td>
		</c:if>
		<c:if test="${param.menu eq 'search'}">
		<td align="left">
					<c:choose>
						<c:when test="${product.proTranCode eq '001'}">
						���ſϷ�
						</c:when>
						<c:when test="${product.proTranCode eq '002'}">
						����� <a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=003">��ǰ�ޱ�</a>
						</c:when>
						<c:when test="${product.proTranCode eq '003'}">
						��ۿϷ�
						</c:when>
						<c:otherwise>
							�Ǹ���
						</c:otherwise>
					</c:choose>
					</td>
		</c:if>	
	</tr>			
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>	
			
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/productPageNavigator.jsp"/>	
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
<%System.out.println("<<<<< listProduct.jsp ���� >>>>>"); %>