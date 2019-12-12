<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>企业结构基础数据分析管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/fzjc/cacheEnterpriseBasicData/">企业结构基础数据分析列表</a></li>
		<li class="active"><a href="${ctx}/fzjc/cacheEnterpriseBasicData/form?id=${cacheEnterpriseBasicData.id}">企业结构基础数据分析<shiro:hasPermission name="fzjc:cacheEnterpriseBasicData:edit">${not empty cacheEnterpriseBasicData.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="fzjc:cacheEnterpriseBasicData:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="cacheEnterpriseBasicData" action="${ctx}/fzjc/cacheEnterpriseBasicData/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">年份：</label>
			<div class="controls">
				<input name="nyear" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					   value="${cacheEnterpriseBasicData.nyear}" onclick="WdatePicker({dateFmt:'yyyy',isShowToday:false,isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业类型：</label>
			<div class="controls">
				<form:select path="enterpriseType" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:option value="国有企业" label="国有企业"/>
					<form:option value="外资企业" label="外资企业"/>
					<form:option value="个体工商" label="个体工商"/>
					<form:option value="农民专业合作社" label="农民专业合作社"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业数量：</label>
			<div class="controls">
				<form:input path="enterpriseCount" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业额：</label>
			<div class="controls">
				<form:input path="enterpriseMoney" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">人数：</label>
			<div class="controls">
				<form:input path="personCount" htmlEscape="false" maxlength="255" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="fzjc:cacheEnterpriseBasicData:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>