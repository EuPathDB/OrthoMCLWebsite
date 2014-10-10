<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:c="http://java.sun.com/jsp/jstl/core"
    xmlns:wdk="urn:jsptagdir:/WEB-INF/tags/wdk"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp">

  <jsp:directive.attribute name="refer" required="false" 
              description="Page calling this tag"/>

  <c:set var="base" value="${pageContext.request.contextPath}"/>

  <jsp:useBean id="websiteRelease" class="org.eupathdb.common.controller.WebsiteReleaseConstants"/>

  <c:set var="debug" value="${requestScope.WEBSITE_RELEASE_STAGE eq websiteRelease.development}"/>
  <!-- JavaScript provided by WDK -->
  <imp:wdkJavascripts refer="${refer}" debug="${debug}"/>

  <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"><jsp:text/></script>

  <script type="text/javascript" src="${base}/wdkCustomization/js/lib/hoverIntent.js"><jsp:text/></script>
  <script type="text/javascript" src="${base}/wdkCustomization/js/lib/superfish.js"><jsp:text/></script>
  <script type="text/javascript" src="${base}/wdkCustomization/js/lib/supersubs.js"><jsp:text/></script>

  <script type="text/javascript" src="${base}/wdkCustomization/js/lib/jquery.timers-1.2.js"><jsp:text/></script>
  <script type="text/javascript" src="${base}/wdkCustomization/js/common.js"><jsp:text/></script>

  <!-- Access twitter/facebook links, and configure menubar (superfish) -->
  <script type="text/javascript" src="${base}/js/nav.js"><jsp:text/></script>

  <c:if test="${refer eq 'summary'}">
    <script type="text/javascript" src="${base}/wdkCustomization/js/customStrategy.js"><jsp:text/></script>
  </c:if>

  <c:if test="${refer eq 'summary' or refer eq 'record'}">
    <script type="text/javascript" src="${base}/wdkCustomization/js/phyletic.js"><jsp:text/></script>
    <script type="text/javascript" src="${base}/wdkCustomization/js/group-layout.js"><jsp:text/></script>
  </c:if>

  <c:if test="${refer eq 'summary' or refer eq 'question'}">
    <script type="text/javascript" src="${base}/wdkCustomization/js/ppform.js"><jsp:text/></script>
  </c:if>

  <c:if test="${refer eq 'record'}">
    <script type="text/javascript" src="${base}/wdkCustomization/js/pfamDomain.js"><jsp:text/></script>
  </c:if>



</jsp:root>
