<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>营商设施完成度管理</title>
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
		<li class="active"><a href="${ctx}/csyx/businessFacilities/">营商设施完成度列表</a></li>
		<shiro:hasPermission name="csyx:businessFacilities:edit"><li><a href="${ctx}/csyx/businessFacilities/form">营商设施完成度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="businessFacilities" action="${ctx}/csyx/businessFacilities/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设施：</label>
				<form:input path="item" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>设施</th>
				<th>完成度</th>
				<th>年月</th>
				<shiro:hasPermission name="csyx:businessFacilities:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="businessFacilities">
			<tr>
				<td><a href="${ctx}/csyx/businessFacilities/form?id=${businessFacilities.id}">
					${businessFacilities.item}
				</a></td>
				<td>
					${businessFacilities.completion}
				</td>
				<td>
					${businessFacilities.year}-${businessFacilities.month}
				</td>
				<shiro:hasPermission name="csyx:businessFacilities:edit"><td>
    				<a href="${ctx}/csyx/businessFacilities/form?id=${businessFacilities.id}">修改</a>
					<a href="${ctx}/csyx/businessFacilities/delete?id=${businessFacilities.id}" onclick="return confirmx('确认要删除该营商设施完成度吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>