<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>污水处置能力趋势分析管理</title>
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
		<li><a href="${ctx}/csyx/catchWaterTrade/">污水处置能力趋势分析列表</a></li>
		<li class="active"><a href="${ctx}/csyx/catchWaterTrade/form?id=${catchWaterTrade.id}">污水处置能力趋势分析<shiro:hasPermission name="csyx:catchWaterTrade:edit">${not empty catchWaterTrade.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="csyx:catchWaterTrade:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="catchWaterTrade" action="${ctx}/csyx/catchWaterTrade/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">年份：</label>
			<div class="controls">
				<form:input path="nyear" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					  onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false,isShowToday:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">处理量：</label>
			<div class="controls">
				<form:input path="processMax" htmlEscape="false" maxlength="9" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">增速：</label>
			<div class="controls">
				<form:input path="speedMax" htmlEscape="false" maxlength="9" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="csyx:catchWaterTrade:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>