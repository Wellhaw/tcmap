<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>营商义务教育管理</title>
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
		<li class="active"><a href="${ctx}/csyx/businessEducation/">营商义务教育列表</a></li>
		<shiro:hasPermission name="csyx:businessEducation:edit"><li><a href="${ctx}/csyx/businessEducation/form">营商义务教育添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="businessEducation" action="${ctx}/csyx/businessEducation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>学校：</label>
				<form:input path="school" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>学校</th>
				<th>数量</th>
				<th>年</th>
				<shiro:hasPermission name="csyx:businessEducation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="businessEducation">
			<tr>
				<td><a href="${ctx}/csyx/businessEducation/form?id=${businessEducation.id}">
					${businessEducation.school}
				</a></td>
				<td>
					${businessEducation.num}
				</td>
				<td>
					${businessEducation.year}
				</td>
				<shiro:hasPermission name="csyx:businessEducation:edit"><td>
    				<a href="${ctx}/csyx/businessEducation/form?id=${businessEducation.id}">修改</a>
					<a href="${ctx}/csyx/businessEducation/delete?id=${businessEducation.id}" onclick="return confirmx('确认要删除该营商义务教育吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>