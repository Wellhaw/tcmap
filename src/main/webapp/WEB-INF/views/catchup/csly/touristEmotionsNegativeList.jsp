<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>负面情绪管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/csly/touristEmotionsNegative/">负面情绪列表</a></li>
		<shiro:hasPermission name="csly:touristEmotionsNegative:edit"><li><a href="${ctx}/csly/touristEmotionsNegative/form">负面情绪添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="touristEmotionsNegative" action="${ctx}/csly/touristEmotionsNegative/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>负面类别：</label>
				<form:input path="category" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>负面类别</th>
				<th>数量</th>
				<shiro:hasPermission name="csly:touristEmotionsNegative:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="touristEmotionsNegative">
			<tr>
				<td><a href="${ctx}/csly/touristEmotionsNegative/form?id=${touristEmotionsNegative.id}">
					${touristEmotionsNegative.category}
				</a></td>
				<td>
					${touristEmotionsNegative.num}
				</td>
				<shiro:hasPermission name="csly:touristEmotionsNegative:edit"><td>
    				<a href="${ctx}/csly/touristEmotionsNegative/form?id=${touristEmotionsNegative.id}">修改</a>
					<a href="${ctx}/csly/touristEmotionsNegative/delete?id=${touristEmotionsNegative.id}" onclick="return confirmx('确认要删除该负面情绪吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>