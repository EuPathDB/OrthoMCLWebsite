<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp">
  <jsp:directive.page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>

  <!-- ORTHO data summary -->
  <imp:pageFrame refer="data-source" title="Release Summary">
    <imp:wdkTable tblName="ReleaseSummary" isOpen="true" dataTable="true"/>
  </imp:pageFrame>

</jsp:root>
