<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:c="http://java.sun.com/jsp/jstl/core"
    xmlns:html="http://jakarta.apache.org/struts/tags-html"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp">

  <!-- serviceList.jsp -->

  <!-- get wdkModel saved in application scope -->
  <c:set var="wdkModel" value="${applicationScope.wdkModel}"/>

  <!-- url base (in leiu of `c:url') -->
  <c:set var="urlBase" value="${pageContext.request.contextPath}"/>

  <!-- get wdkModel name to display as page header -->
  <c:set value="${wdkModel.displayName}" var="wdkModelDispName"/>
  <imp:pageFrame title="${wdkModelDispName}" bufferContent="true">

    <c:set var="margin" value="15px"/>

    <!-- this should be read from the model -->
    <c:if test="${wdkModelDispName eq 'FungiDB'}">
          <c:set var="organism" value="Aspergillus clavatus"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'AmoebaDB'}">
          <c:set var="organism" value="Entamoeba dispar"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'CryptoDB'}">
          <c:set var="organism" value="Cryptosporidium parvum,Cryptosporidium hominis"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'EuPathDB'}">
          <c:set var="organism" value="Cryptosporidium parvum,Leishmania major,Toxoplasma gondii"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'MicrosporidiaDB'}">
            <c:set var="organism" value="Encephalitozoon cuniculi"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'PiroplasmaDB'}">
            <c:set var="organism" value="Babesia bovis,Theileria annulata,Theileria parva"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'PlasmoDB'}">
            <c:set var="organism" value="Plasmodium falciparum,Plasmodium knowlesi"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'ToxoDB'}">
            <c:set var="organism" value="Toxoplasma gondii,Neospora caninum"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'GiardiaDB'}">
            <c:set var="organism" value="Giardia Assemblage A,Giardia Assemblage B"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'TrichDB'}">
            <c:set var="organism" value="Trichomonas vaginalis"/>
    </c:if>
    <c:if test="${wdkModelDispName eq 'TriTrypDB'}">
            <c:set var="organism" value="Leishmania braziliensis,Trypanosoma brucei"/>
    </c:if>

    <!-- display wdkModel introduction text -->
    <h1>Searches via Web Services</h1>
    <br/>
    ${wdkModelDispName} provides programmatic access to
    <a href="${urlBase}/queries_tools.jsp">its searches</a>,
    via <a href="http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm">
      <b>REST</b></a> Web Services. 
    The result of a web service request is a list of records (genes, ESTs, etc)
    in either <a href="http://www.w3.org/XML/">XML</a> or
    <a href="http://json.org/">JSON</a> format. 
    REST services can be executed in a browser by typing a specific URL. 

    <br/>
    <br/>

    For example, this URL: <br/>
    <span style="position:relative;left:${margin};font-size:150%">
      <a href="${baseUrl}/webservices/GeneQuestions/GenesByMolecularWeight.xml?min_molecular_weight=10000&amp;max_molecular_weight=50000&amp;organism=${organism}&amp;o-fields=gene_type,organism">
        http://${wdkModelDispName}.org/webservices/GeneQuestions/GenesByMolecularWeight.xml?
        <br/>min_molecular_weight=10000&amp;
        <br/>max_molecular_weight=50000&amp;
        <br/>organism=${organism}&amp;
        <br/>o-fields=gene_type,organism</a>
    </span>

    <br/>
    <br/>
    Corresponds to this request: 
    <br/>
    <span style="font-style:italic;font-weight:bold;position:relative;left:${margin};">
      Find all (${organism}) genes that have molecular weight between 10,000 and 50,000. 
      <br/>For each gene ID in the result, return its gene type and organism.
      <br/>Provide the result in an XML document.
    </span>

    <br/>
    <br/>
    <br/>

    <hr/>

    <h2>WADLs: how to generate web service URLs</h2>
    Click on a search below to access its <a href="http://www.w3.org/Submission/wadl/">WADL</a>
    (Web Application Description Language). 

    <br/>

    <span style="position:relative;left:${margin};">
      <ul class="cirbulletlist">
        <li>A WADL is an XML document that describes in detail how to form a URL
          to call the search as a web service request. For more details go to
          <a style="font-size:120%;font-weight:bold" href="#moreWADL">How to read a WADL</a>
          at the bottom of this page.
        </li>
        <li>Note: some browsers (e.g.: Safari) do not know how to render an XML
          file properly (you will see a page full of terms with no structure).
        </li>
        <li>To construct the URL in the example above, you would check the
          <a href="/webservices/GeneQuestions/GenesByMolecularWeight.wadl">Molecular Weight</a>
          WADL located below under <b>Protein Attributes</b>
        </li>
      </ul>
    </span>

    <br/>

    <c:if test="${wdkModelDispName eq 'EuPathDB'}">
      <i>(Note: The parameter "o-tables" is not available from EuPathDB.)</i>
    </c:if>

    <!-- show all questionSets in model, driven by categories as in menubar -->
    <ul id="webservices-list">
      <imp:searchCategories from="webservices" />
    </ul>

    <br/>
    <hr/>
    <br/>

    <a name="moreWADL"><jsp:text/></a>
    <h2>How to read a WADL</h2>

    <ul>
      <li>(1) What is the name and purpose of the search.
        <span style="position:relative;left:${margin};">
          <br/>Under <span style="font-style:italic;font-weight:bold">&amp;lt;method name=....&amp;gt;</span>
          <br/>In our example: <span style="font-style:italic;font-weight:bold">
            &amp;lt;doc title="description"&amp;gt;Find genes whose .....
            Molecular weights are ......&amp;lt;/doc&amp;gt;</span>
        </span>
        <br/>
      </li>

      <li>(2) What is the service URL. 
        <span style="position:relative;left:${margin};">
          <br/>Under <span style="font-style:italic;font-weight:bold">&amp;lt;resource path=....&amp;gt;</span>. 
          <br/>It includes an extension that indicates the format requested for the result (XML or JSON).
          <br/>In our example: <span style="font-style:italic;color: blue">
            http://${wdkModelDispName}.org/webservices/GeneQuestions/GenesByMolecularWeight.xml</span>
        </span>
        <br/>
      </li>

      <li>(3) How to constrain your search.
        <span style="position:relative;left:${margin};">
          <br/>Under <span style="font-style:italic;font-weight:bold"> &amp;lt;param name=.....&amp;gt;</span>. 
          <br/>If a default value is provided under &amp;lt;doc title="default"&amp;gt;.....&amp;lt;/doc&amp;gt;,
          then providing the parameter is optional.
          <br/>In our example: <span style="font-style:italic;color: blue">
            min_molecular_weight=10000, max_molecular_weight=50000</span>.
        </span>
        <br/>
      </li>

      <li>(4) What to return for each ID in the result.
        <span style="position:relative;left:${margin};">
          <br/>Under <span style="font-style:italic;font-weight:bold"> &amp;lt;param name=.....&amp;gt;</span> too.
          <br/>These are the same for all searches of a given record type
          (e.g., for all gene searches). Output-fields are single-valued
          attributes while output-tables are multi-valued (array).
          <br/>In our example: <span style="font-style:italic;color: blue">
            o-fields=gene_type,organism_full&amp;o-tables=EcNumber</span>
        </span>
      </li>
    </ul>
  </imp:pageFrame>
</jsp:root>
