<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>社区公共卫生服务</title>
	<link href="${appPublic}/Base/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="${appPublic}/Base/css/base.css">
	<link rel="stylesheet" href="${appPublic}/Backstage/css/monitor.css">

</head>
<body>
<div class="wrapper">
	<div class="main">
		<div class="side">
			<div class="m-datetime">
				<div class="m-time"></div>
				<div class="m-date"></div>
			</div>
			<div class="side-item side-active" onclick="window.location.href='${appRoot}/Backstage/user'">
				<span class="side-ico icon-user"></span>
				<span class="side-text">用户管理</span>
			</div>
			<div class="side-item" onclick="window.location.href='${appRoot}/Backstage/doctor'">
				<span class="side-ico icon-user-md"></span>
				<span class="side-text">医生管理</span>
			</div>
			<div class="side-item" onclick="window.location.href='${appRoot}/Backstage/interfaces'">
				<span class="side-ico icon-magnet"></span>
				<span class="side-text">接口管理</span>
			</div>
			<%--<div class="side-item" onclick="window.location.href='${appRoot}/Backstage/report'">--%>
				<%--<span class="side-ico icon-bar-chart"></span>--%>
				<%--<span class="side-text">数据分析</span>--%>
			<%--</div>--%>
		</div>
		<div class="content">
			<div class="title"><a href="${appRoot}/Backstage/user">用户管理</a> > 健康档案 > ${userName}</div>
			<div class="table">
				<table>
					<thead>
						<tr>
							<th>检测项</th>
							<th>监测值</th>
							<th>检测类型</th>
							<th>创建时间</th>
							<th colspan="2">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${monitors}" var="monitor">
							<tr>
								<td>${monitor.name}</td>
								<td>${monitor.values}</td>
								<td>${monitor.type}</td>
								<td>${monitor.createAt}</td>
								<td><a class="table-href icon-pencil"></a></td>
								<td><a class="table-href icon-trash"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="page">
                <c:if test="${page > 0}">
                    <a class="icon-chevron-left" href="${appRoot}/Backstage/monitor?userId=${userId}&userName=${userName}&page=${page-1}"></a>
                </c:if>
                <c:forEach var="item" varStatus="status" begin="0" end="${size}">
                    <c:choose>
                        <c:when test="${status.index == page}">
                            <a class="active" href="${appRoot}/Backstage/monitor?userId=${userId}&userName=${userName}&page=${status.index}">${status.index+1}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${appRoot}/Backstage/monitor?userId=${userId}&userName=${userName}&page=${status.index}">${status.index+1}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${page < size}">
                    <a class="icon-chevron-right" href="${appRoot}/Backstage/monitor?userId=${userId}&userName=${userName}&page=${page+1}"></a>
                </c:if>
				<div class="search">
					<span>跳至</span>
					<select class="searchPage" name="search" data-user="&userId=${userId}&userName=${userName}">
                        <option value=""></option>
                        <c:forEach var="item" varStatus="status" begin="0" end="${size}">
                            <option value="${status.index}">${status.index+1}</option>
                        </c:forEach>
					</select>
					<span>页</span>
				</div>
			</div>
		</div>
		<div class="exit icon-remove-sign" title="退出系统" onclick="window.location.href='${appRoot}/Backstage/exit'"></div>
	</div>
</div>
<script type="text/javascript">
	var appRoot = "${appRoot}";
	var appPath = "${appPath}";
	var appPublic = "${appPublic}";
</script>
<script src="${appPublic}/Extend/JQuery/jquery-1.10.1.min.js"></script>
<script src="${appPublic}/Backstage/js/monitor.js"></script>
</body>
</html>