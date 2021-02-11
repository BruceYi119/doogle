<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="demo" class="carousel slide mt10 mb10" data-ride="carousel">
	<ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active"></li>
		<li data-target="#demo" data-slide-to="1"></li>
		<li data-target="#demo" data-slide-to="2"></li>
	</ul>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="/static/front/img/main_banner01.jpg" alt="배너1">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/main_banner02.jpg" alt="배너2">
		</div>
		<div class="carousel-item">
			<img src="/static/front/img/main_banner03.jpg" alt="배너3">
		</div>
	</div>
	<a class="carousel-control-prev" href="#demo" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
	<a class="carousel-control-next" href="#demo" data-slide="next"><span class="carousel-control-next-icon"></span></a>
</div>
<div class="flexWeap">
	<div class="left">
		<div class="covidWrrap">
			<h4>Today 코로나 현황</h4>
			<div id="covidLoding">
				<div class="spinner-border text-muted"></div>
			</div>
		</div>
	</div>
	<div class="right">
		<div class="weatherWrap">
			<h4>현재 날씨(서울특별시)</h4>
			<div id="weatherLoding">
				<div class="spinner-border text-muted"></div>
			</div>
		</div>
	</div>
</div>