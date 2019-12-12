<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>企业结构基础数据分析管理</title>
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
		<li class="active"><a href="${ctx}/fzjc/cacheEnterpriseBasicData/">企业结构基础数据分析列表</a></li>
		<shiro:hasPermission name="fzjc:cacheEnterpriseBasicData:edit"><li><a href="${ctx}/fzjc/cacheEnterpriseBasicData/form">企业结构基础数据分析添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="cacheEnterpriseBasicData" action="${ctx}/fzjc/cacheEnterpriseBasicData/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<!--<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>-->
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>年份</th>
				<th>企业类型</th>
				<th>企业数量</th>
				<th>营业额</th>
				<th>人数</th>
				<shiro:hasPermission name="fzjc:cacheEnterpriseBasicData:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="cacheEnterpriseBasicData">
			<tr>
				<td><a href="${ctx}/zhcs/cacheEnterpriseBasicData/form?id=${catchTravelInfo.id}">
						${cacheEnterpriseBasicData.nyear}
				</a></td>
				<td>
						${cacheEnterpriseBasicData.enterpriseType}
				</td>
				<td>
						${cacheEnterpriseBasicData.enterpriseCount}
				</td>
				<td>
						${cacheEnterpriseBasicData.enterpriseMoney}
				</td>
				<td>
						${cacheEnterpriseBasicData.personCount}
				</td>
				<shiro:hasPermission name="fzjc:cacheEnterpriseBasicData:edit"><td>
    				<a href="${ctx}/fzjc/cacheEnterpriseBasicData/form?id=${cacheEnterpriseBasicData.id}">修改</a>
					<a href="${ctx}/fzjc/cacheEnterpriseBasicData/delete?id=${cacheEnterpriseBasicData.id}" onclick="return confirmx('确认要删除该企业结构基础数据分析吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>