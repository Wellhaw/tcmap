<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>一月各来源情绪占比管理</title>
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
		<li class="active"><a href="${ctx}/csly/touristEmotionMonth/">一月各来源情绪占比列表</a></li>
		<shiro:hasPermission name="csly:touristEmotionMonth:edit"><li><a href="${ctx}/csly/touristEmotionMonth/form">一月各来源情绪占比添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="touristEmotionMonth" action="${ctx}/csly/touristEmotionMonth/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>来源：</label>
				<form:input path="source" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>正负面：</label>
				<form:input path="state" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>来源</th>
				<th>正负面</th>
				<th>数量</th>
				<shiro:hasPermission name="csly:touristEmotionMonth:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="touristEmotionMonth">
			<tr>
				<td><a href="${ctx}/csly/touristEmotionMonth/form?id=${touristEmotionMonth.id}">
					${touristEmotionMonth.source}
				</a></td>
				<td>
					${touristEmotionMonth.state}
				</td>
				<td>
					${touristEmotionMonth.num}
				</td>
				<shiro:hasPermission name="csly:touristEmotionMonth:edit"><td>
    				<a href="${ctx}/csly/touristEmotionMonth/form?id=${touristEmotionMonth.id}">修改</a>
					<a href="${ctx}/csly/touristEmotionMonth/delete?id=${touristEmotionMonth.id}" onclick="return confirmx('确认要删除该一月各来源情绪占比吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>