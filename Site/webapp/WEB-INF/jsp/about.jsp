<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="2.0"
    xmlns:jsp="http://java.sun.com/JSP/Page"
    xmlns:imp="urn:jsptagdir:/WEB-INF/tags/imp">
  <jsp:directive.page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"/>
  <imp:pageFrame title="${wdkModel.displayName} :: About" refer="about" bufferContent="false">
    <div id="about">
      <!-- Provides section-selection drop-down
      <div id="top" class="about-nav">
          <form>
            <select id="navSel" onchange="window.location='#'+$(this).find(':selected').attr('name');">
              <option name="">Jump to...</option>
              <option name="release">Current Release 6.1</option>
              <option name="forming_groups">Method for Forming and Expanding Ortholog Groups</option>
              <option name="orthomcl_algorithm">The OrthoMCL Algorithm</option>
              <option name="background">Background on Orthology and Prediction</option>
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

        <div id="release" class="section-title">
          <h2>Current Release 6.1</h2>
        </div>
        <div class="section-content">
          <p>
	    This release contains two substantial changes:
	    <ol>
	      <li>All proteins from a new set of 150 <b>Core</b> species were used to form <b>Core</b> ortholog groups.</li>
	      <li>All proteins from 394 additional species, termed <b>Peripheral</b> species, are mapped into the Core ortholog groups. Any proteins that fails to map is used to create a <b>Residual</b> group. This design will allow us to map new proteomes at each new release (~3 months).</li>
	    </ol>
	  </p>
	  <p>
	    The proteome data for this release was acquired from these
            <a href="${pageContext.request.contextPath}/getDataSummary.do?summary=data">Proteome Sources</a>.
            The number of sequences and ortholog groups in each proteome is shown in the
            <a href="${pageContext.request.contextPath}/getDataSummary.do?summary=release">Proteome Statistics</a>.
          </p>
          <p>
            <strong>Downloads:</strong>
            Go to the <a href="/common/downloads">download site</a> to obtain the protein sequences
            and ortholog groups used in this release.
          </p>
        </div>

        <div id="forming_groups" class="section-title">
          <h2>Method for Forming and Expanding Ortholog Groups</h2>
        </div>
        <div class="section-content">
          <p>
	    Proteins are placed into Ortholog Groups by the following steps:
	  <ol>
	    <li>The OrthoMCL algorithm (see below) is employed on proteins from a set of 150 <b>Core</b> species to form <b>Core</b> ortholog groups. The species were carefully chosen based on proteome quality and widespread placement across the tree of life. Each Core protein is placed by the algorithm into a <b>Core</b> ortholog group consisting of one or more proteins. Core group names have the format OG6_xxxxxx (e.g., OG6_101327). OG6 refers to OrthoMCL version 6; for each version (lasting ~2 years), the Core species and the Core ortholog group names will remain constant.</li>
	    <li>The proteins from hundreds of additional organisms, termed <b>Peripheral</b> organisms, are BLASTed against all proteins in the Core groups. For each <b>Peripheral</b> protein, the best BLAST score is used to assign the protein to a Core group, but only if the E-Value &lt; 1e-5 and the percent match length &gt;= 50%.</li>
	    <li>All Peripheral proteins that fail to map to a Core group are collected and subjected to independent OrthoMCL analysis, forming <b>Residual</b> groups consisting of one or more proteins. Residual group names have the format OG6r1_xxxxxx (e.g., OG6r1_101327), where r1 refers to release 1.</li>
	    <li>For each subsequent release, proteomes from additional <b>Peripheral</b> organisms will be processed as in steps 2 and 3 above. However, step 3 will differ slightly because the previous set of Residual groups will be disassembled, leaving the previous unmapped Peripheral proteins to be combined with the new unmapped Peripheral proteins. All of these proteins will be used to form new Residual groups (e.g., OG6r2_xxxxxx).</li>
	    <li>For each subsequent version, a new set of Core species will be defined, leading to the formation of new Core groups (e.g., OG7_xxxxxx) and Residual groups (e.g., OG7r1_xxxxxx).</li>
	  </ol>
	  </p>
	  <p>
	    This design allows for the addition of proteomes at every release (~3 months). Note that <b>Core</b> groups (e.g., OG6_101327) will remain between releases, though these groups will expand as Peripheral proteins are mapped in. In contrast, <b>Residual</b> groups will exist only for that release (~3 months); thus, Residual groups are useful in allowing the user to find proteins related to their protein(s) of interest, but are not stable groups.
	  </p>

        </div>

        <div id="orthomcl_algorithm" class="section-title">
          <h2>The OrthoMCL Algorithm</h2>
        </div>
        <div class="section-content">
          <p>
            See the <b><a href="https://docs.google.com/document/d/1RB-SqCjBmcpNq-YbOYdFxotHGuU7RK_wqxqDAMjyP_w/pub">OrthoMCL Algorithm Document</a></b> for a detailed description of the OrthoMCL algorithm.
            
          </p>
           In overview:
           <ul class="cirbulletlist">
           <li>All-v-all BLASTP of the proteins.</li>
           <li>Compute <i>percent match length</i>
             <ul class="cirbulletlist">
             <li>Select whichever is shorter, the query or subject sequence.  Call that sequence S.</li>
             <li>Count all amino acids in S that participate in any HSP.</li>
             <li>Divide that count by the length of S and multiply by 100</li>
             </ul>
           </li>
           <li>Apply thresholds to blast result.  Keep matches with E-Value &lt; 1e-5 percent match length &gt;= 50%</li>
           <li>Find potential inparalog, ortholog and co-ortholog <i>pairs</i> using the Orthomcl Pairs program.  (These are the pairs that are counted to form the <i>Average % Connectivity</i> statistic per group.)</li>
           <li>Use the <a href="http://micans.org/mcl/">MCL</a> program to cluster the pairs into groups</li>
           </ul>
        </div>

        <div id="background" class="section-title">
          <h2>Background on Orthology and Prediction</h2>
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
        <div id="faq" class="section-title">
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
        <div id="software" class="section-title">
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
        <div id="pubs" class="section-title">
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
        <div id="acknowledge" class="section-title">
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
            VEuPathDB, PCBI, and the Penn Center for Bioinformatics who have contributed to the
	    project include: Mark Hickman, Steve Fischer, Brian Brunk, Omar Harb, Ryan Doherty,
	    Aaron Mackey, Praveen Chakravarthula, Jerric Gao, and Charles Treatman. We'd also
	    like to thank students and postdocs from the Roos lab for valuable suggestions,
	    specifically Lucia Peixoto, and Dhanasekaran Shanmugam.
          </p>
        </div>
        <div id="contact" class="section-title">
          <h2>Contact</h2>
        </div>
        <div class="section-content">
          <p>
            Feel free to contact us with comments or questions by filling out the
            <a href="${pageContext.request.contextPath}/contact.do" class="open-window-contact-us">Contact Us</a>
            form, or emailing us at <a href="mailto:help@orthomcl.org">help@orthomcl.org</a>.
          </p>
        </div>
      </div>
    </div>

  </imp:pageFrame>
</jsp:root>
