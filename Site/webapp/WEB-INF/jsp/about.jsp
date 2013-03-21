<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp">
  <jsp:directive.page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>
  <imp:pageFrame title="${wdkModel.displayName} :: About" refer="about">
    <div id="about">
      <!-- Provides section-selection drop-down
      <div class="about-nav">
        <a name="top">
          <form>
            <select id="navSel" onchange="window.location='#'+$(this).find(':selected').attr('name');">
              <option name="">Jump to...</option>
              <option name="release">Current Release</option>
              <option name="methods">Methods</option>
              <option name="background">Background</option>
              <option name="faq">Frequently Asked Questions</option>
              <option name="software">Software</option>
              <option name="pubs">Publications</option>
              <option name="acknowledge">Acknowledgements</option>
              <option name="contact">Contact</option>
            </select>
          </form>
        </a>
      </div> -->
      <div class="about-title">
        <h1>About OrthoMCL</h1>
      </div>
      <div class="about-body">
        <div class="section-title">
          <a name="release" href="#top">Top</a>
          <h2>Current Release</h2>
        </div>
        <div class="section-content">
          <p>
            The genome data for this release was acquired from these
            <a href="${pageContext.request.contextPath}/getDataSummary.do?summary=data">Genome Sources</a>.
            The number of sequences and groups in each genome is shown in the
            <a href="${pageContext.request.contextPath}/getDataSummary.do?summary=release">Genome Statistics</a>.
          </p>
          <p>
            <strong>Downloads:</strong>
            Go to the <a href="/common/downloads">download site</a> to get the protein sequences
            used in this release and the ortholog groups.
          </p>
        </div>
        <div class="section-title">
          <a name="methods" href="#top">Top</a>
          <h2>Methods</h2>
        </div>
        <div class="section-content">
          <p>
            The methods used to build OrthoMCL-DB are formally described in the
            <a href="http://docs.google.com/View?id=dd996jxg_1gsqsp6">OrthoMCL Algorithm Document</a>
          </p>
        </div>
        <div class="section-title">
          <a name="background" href="#top">Top</a>
          <h2>Background</h2>
        </div>
        <div class="section-content">
          <p>
            Orthologs are homologs seperated by speciation events.  Paralogs are homologs separated
            by duplication events. Detection of orthologs is becoming much more important with the
            rapid progress in genome sequencing.
          </p>
          <p>
            OrthoMCL is a genome-scale algorithm for grouping orthologous protein sequences. It
            provides not only groups shared by two or more species/genomes, but also groups
            representing species-specific gene expansion families.  So it serves as an important
            utility for automated eukaryotic genome annotation. OrthoMCL starts with reciprocal best
            hits within each genome as potential in-paralog/recent paralog pairs and reciprocal best
            hits across any two genomes as potential ortholog pairs.  Related proteins are interlinked
            in a similarity graph. Then MCL (Markov Clustering algorithm,Van Dongen 2000;
            <a href="http://micans.org/mcl/">www.micans.org/mcl</a>) is invoked to split mega-clusters.
            This process is analogous to the manual review in COG construction.  MCL clustering is
            based on weights between each pair of proteins, so to correct for differences in
            evolutionary distance the weights are normalized before running MCL.
          </p>
          <p>
            OrthoMCL is similar to the INPARANOID algorithm (Remm, Storm et al. 2001), but is extended
            to cluster orthologs from multiple species. OrthoMCL clusters are coherent with groups
            identified by EGO (Lee, Sultana et al. 2002), and an analysis using EC number suggests a
            high degree of reliability (Li, Stoeckert et al. 2003).
          </p>
          <p>
            In a recent assessment (Chen, et al. 2007), the performance of seven widely used orthology
            detection algorithms, representing three kinds of strategies (phylogeny-based, evolutionary
            distance-based and BLAST-based), are evaluated using the statistical technique Latent Class
            Analysis (LCA). LCA is useful when there are large data sets available but no gold standard.
            The results show an overall trade-off between sensitivity and specificity among these
            algorithms, with INPARANOID and OrthoMCL as the two best methods having both False Positive
            (FP) and False Negative (FN) error rates lower than 20%.
          </p>
        </div>
        <div class="section-title">
          <a name="faq" href="#top">Top</a>
          <h2>Frequently Asked Questions</h2>
        </div>
        <div class="section-content">
          <ol>
            <li>
              <span class="question">What group information is provided?</span>
              <p>
                For each ortholog group, we provide basic information and other useful data about the group:
                <ol>
                  <li>Size of the group, in terms of both number of sequences and number of taxa.</li>
                  <li>Sequence similarity info, indicating the degree of conservation within the group: % Match Pairs (percentage of all possible pairs within the group that are matched through BLAST under the default cutoff, and the rest of similarity info is calculated based on these matched pairs only), Average E-value, Average % Coverage, and Average % Identity.</li>
                  <li>Phyletic profile, displaying #sequences from each species that belong to this ortholog group; black box indicates presence (with the number below the genome abbreviation representing #sequences) while white box stands for absence.</li>
                  <li>Keywords: the most frequently occurring keywords in the annotations of the member sequences.</li>
                  <li>Pfam domains: the most frequently occurring Pfam domains in the member sequences.</li>
                  <li>Pfam domain architecture: useful to compare among group members and to identify outliers (due to evolution or sequencing/gene model errors).</li>
                  <li>BioLayout graph, displaying the sequence similarity relationship between group members together with OrthoMCL edge information (in the SVG version of the graph).</li>
                  <li>Multiple Sequence Alignment of the ortholog group.</li>
                </ol>
              </p>
            </li>
            <li>
              <span class="question">Which software was used to generate the MSAs (multiple sequence alignments) and BioLayout graphs?</span>
              <p>
                MUSCLE (3.52), and a special version of BioLayout (from Leon Goldovsky, EBI) which can generate PNG figures.
              </p>
            </li>
            <li>
              <span class="question">Why do some groups have no links to an MSA or BioLayout graph?</span>
              <p>
                For big groups (size>100), we don't provide them because there are difficulties running MSA and BioLayout softwares for big groups. However, you can still download fasta sequences from our database and run alignment by yourself. As for BioLayout graph, you can contact us at help@orthomcl.org to request BioLayout input files.
              </p>
            </li>
            <li>
              <span class="question">How can I find all <i>E. coli</i> genes (protein sequences) which have human orthologs?</span>
              <p>
                OrthoMCL-DB includes the <a href="http://code.google.com/p/strategies-wdk/">StrategiesWDK</a> system to allow you to form complex search strategies. In this case, several steps are required to find the answer:
                <ol>
                  <li>Find all ortholog groups that contain both human and <i>E. coli</i> sequences.  To do this, on the OrthoMCL home page select the "Phyletic Pattern" search under the "Identify Ortholog Groups" heading.  On that search's page, follow these steps</li>
                  <ol>
                    <li>Click once on the gray circle next to "ecol" and click once on the gray circle next to "hsap".  Clicking once will convert the gray circle into a green check mark indicating that the organism or phyletic group have been selected.</li>
                    <li>An alternative method for defining the phyletic pattern is to use an orthology phyletic pattern expression.  For this example the expression would be "ecol+hsap=2T".  Additional details describing phyletic pattern expressions are available on the search page.</li>
                    <li>Once you are satisfied with the selected parameters, click on the "Get Answer" button.  The search will return all OrthoMCL groups that contain both <i>E. coli</i> and human sequences.</li>
                  </ol>
                  <li>Retrieve the list of sequences contained in the identified groups.  Click on the "Add Step" button and select "Transform to Sequences" in the popup window, then click on "continue."  This transformation will return all sequences found in all the groups from the previous step.  This will include <i>E. coli</i> and human sequences in addition to all other sequences found in these groups.</li>
                  <li>Limit the list of results to those from <i>E. coli</i>. Click on the "Add Step" button and select "Taxonomy" under the "Search for Sequences by:" category in the popup window.</li>
                  <li>Type the taxon abbreviation for <i>E. coli</i> "ecol". Select the intersect operation for combining search results and click on 'Run Step".</li>
                </ol>
              </p>
            </li>
          </ol>
        </div>
        <div class="section-title">
          <a name="software" href="#top">Top</a>
          <h2>Software</h2>
        </div>
        <div class="section-content">
          <p>
            OrthoMCL was originally implemented by Li Li.  The software was not available for download.
          </p>
          <p>
            <a href="/common/downloads/software">Version 1.4</a> was developed as publicly available software by Feng Chen (This version is now not supported).
          </p>
          <p>
            <a href="/common/downloads/software">Version 2.0</a> was re-engineered to handle large-scale datasets (hundreds of genomes) by Steve Fischer, Mark Heiges, John Iodice, and Ryan Thibodeau
          </p>
        </div>
        <div class="section-title">
          <a name="pubs" href="#top">Top</a>
          <h2>Publications</h2>
        </div>
        <div class="section-content">
          <ol>
            <li>
              Li Li, Christian J. Stoeckert, Jr., and David S. Roos<br/>
              OrthoMCL: Identification of Ortholog Groups for Eukaryotic Genomes<br/>
              Genome Res. 2003 13: 2178-2189.
                <a href="http://www.genome.org/cgi/content/abstract/13/9/2178">[Abstract]</a>
                <a href="http://www.genome.org/cgi/content/full/13/9/2178">[Full Text]</a>
            </li>
            <li>
              Feng Chen, Aaron J. Mackey, Christian J. Stoeckert, Jr., and David S. Roos<br/>
              OrthoMCL-DB: querying a comprehensive multi-species collection of ortholog groups <br/>
              Nucleic Acids Res. 2006 34: D363-8.
                <a href="http://nar.oxfordjournals.org/cgi/content/full/34/suppl_1/D363">[Full Text]</a><br/>
                * Please cite this paper if you publish research results benefited from OrthoMCL-DB.
            </li>
            <li>
              Feng Chen, Aaron J. Mackey, Jeroen K. Vermunt, and David S. Roos <br/>
              Assessing Performance of Orthology Detection Strategies Applied to Eukaryotic Genomes<br/>
              PLoS ONE 2007 2(4): e383.
                <a href="http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0000383">[Full Text]</a><br/>
                * Recommended in <a href="http://www.f1000biology.com/article/id/1092076">Faculty1000</a>
            </li>
            <li>
            Fischer, S., Brunk, B. P., Chen, F., Gao, X., Harb, O. S., Iodice, J. B., Shanmugam, D., Roos, D. S. and Stoeckert, C. J.<br/>
            Using OrthoMCL to Assign Proteins to OrthoMCL-DB Groups or to Cluster Proteomes Into New Ortholog Groups<br/>
            Current Protocols in Bioinformatics. 2011 35:6.12.1–6.12.19.
              <a href="http://onlinelibrary.wiley.com/doi/10.1002/0471250953.bi0612s35/full">[Full Text]</a>
            </li>
          </ol>
        </div>
        <div class="section-title">
          <a name="acknowledge" href="#top">Top</a>
          <h2>Acknowledgements</h2>
        </div>
        <div class="section-content">
          <p>
            This project has been funded in whole or in part with Federal funds from the National
            Institute of Allergy and Infectious Diseseases, National Institutes of Health, Department
            of Health and Human Services, under Contract No. HHSN266200400037C. The major PIs are
            Drs. David Roos and Chris Stoeckert.
          </p>
          <p>
            The OrthoMCL-DB project was initiated by Feng Chen in April 2005, and people from
            PCBI/Penn Center for Bioinformatics who have contributed to the project include: Aaron
            Mackey, Brian Brunk, Praveen Chakravarthula, Jerric Gao, Steve Fischer, Ryan Doherty, and
            Charles Treatman.  We'd also like to thank students and postdocs from the Roos lab for
            valuable suggestions, specifically Lucia Peixoto, Omar Harb and Dhanasekaran Shanmugam.
          </p>
        </div>
        <div class="section-title">
          <a name="contact" href="#top">Top</a>
          <h2>Contact</h2>
        </div>
        <div class="section-content">
          <p>
            Feel free to contact us with comments or questions by filling out the form
            <a href="javascript:void()" class="open-dialog-contact-us">here</a>, or emailing us at
            <a href="mailto:help@orthomcl.org">help@orthomcl.org</a>.
          </p>
        </div>
      </div>
    </div>

  </imp:pageFrame>
</jsp:root>
