<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:c="http://java.sun.com/jsp/jstl/core"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp"
	xmlns:svg="http://www.w3.org/2000/svg">
  <jsp:directive.page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>

  <c:set var="layout" value="${requestScope.layout}" />
  <c:set var="taxons" value="${layout.taxons}" />

  <div class="group-layout" data-controller="orthomcl.group.layout.init">

    <div class="data">

      <div class="taxons">
        <c:forEach items="${taxons}" var="taxon">
          <span class="taxon" id="${taxon.abbrev}" 
                data-color="${taxon.color}" data-group-color="${taxon.groupColor}"
                data-common-name="${taxon.commonName}" data-species="${taxon.species}"
                data-parent="${taxon.parent.abbrev}" data-sort-index="${taxon.sortIndex}" >
            ${taxon.name}
          </span>
        </c:forEach>
      </div>

      <div class="nodes">
        <c:forEach items="${layout.nodes}" var="node">
          <c:set var="gene" value="${node.gene}" />
          <span class="node" id="${node.index}" data-source-id="${gene.sourceId}" 
                data-taxon="${gene.taxon.abbrev}" data-length="${gene.length}">
            ${gene.description}
          </span>
        </c:forEach>
      </div>

      <div class="edges">
        <c:forEach items="${layout.edges}" var="edge">
          <span class="edge" id="${edge.nodeA.index}-${edge.nodeB.index}"
                data-type="${edge.type.code}" data-evalue="${edge.evalue}" 
                data-query="${edge.nodeA.index}" data-subject="${edge.nodeB.index}"
                data-score="${edge.scoreFormatted}" data-color="${edge.color}" />
        </c:forEach>
      </div>

    </div>

    <div class="controls">

      <div class="edge-control accordion">
        <h3>Edge Options</h3>
        <div>
          <div>
             Display By: 
             <input name="edge-display" class="edge-display" type="radio" value="type" checked="checked" /> Types
             <input name="edge-display" class="edge-display" type="radio" value="score" /> Blast scores
          </div>
          <div class="type-control control-section">
            <input class="edge-type" type="checkbox" value="Ortholog" checked="checked" /> 
            <div class="edge-legend Ortholog"> </div> Ortholog <br />
            <input class="edge-type" type="checkbox" value="Coortholog" checked="checked" />
            <div class="edge-legend Coortholog"> </div> Coortholog <br />
            <input class="edge-type" type="checkbox" value="Inparalog" checked="checked" /> 
            <div class="edge-legend Inparalog"> </div> Inparalog <br />
            <input class="edge-type" type="checkbox" value="Normal" /> 
            <div class="edge-legend Normal"> </div> Normal
          </div>
          <div class="score-control control-section">
            E-Value cutoff: 
            <div class="evalue slider" 
			     data-min-exp="${layout.minEvalueExp}" data-max-exp="${layout.maxEvalueExp}"> </div>
			1E<span class="evalue-exp"> </span>
          </div>
        </div>
      </div>

      <div class="node-control accordion">
        <h3>Node Options</h3>
        <div>
          <div>Taxons:</div>
		  <div class="tips">(Mouseover taxons to highlight genes)</div>
          <c:forEach items="${layout.taxonCounts}" var="entity">
		    <c:set var="taxon" value="${taxons[entity.key]}" />
            <div class="taxon" id="${taxon.abbrev}">
              <div class="taxon-legend" style="background:${taxon.color};border-color:${taxon.groupColor}"> </div>
              ${taxon.name} 
			  <c:if test="${taxon.commonName != null}"> / ${taxon.commonName} </c:if>
			  (${entity.value} genes)
            </div>
          </c:forEach>
        </div>
      </div>

    </div>

    <svg class="canvas" width="${layout.size}px" height="${layout.size}px" 
	     viewBox="0 0 ${layout.size} ${layout.size}">
      <rect class="background" x="0" y="0" width="${layout.size}" height="${layout.size}"/>

      <c:forEach items="${layout.edges}" var="edge">
            <line class="edge ${edge.type}" id="${edge.nodeA.index}-${edge.nodeB.index}" 
                  x1="${edge.nodeA.xFormatted}" y1="${edge.nodeA.yFormatted}" 
				  x2="${edge.nodeB.xFormatted}" y2="${edge.nodeB.yFormatted}" />
      </c:forEach>
	
      <c:forEach items="${layout.nodes}" var="node">
            <c:set var="gene" value="${node.gene}" />
            <circle id="${node.index}" class="node ${gene.taxon.abbrev}" 
			        cx="${node.xFormatted}" cy="${node.yFormatted}" r="5" />
      </c:forEach>

    </svg>

  </div>

</jsp:root>
