package org.orthomcl.model.layout;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.orthomcl.model.GenePair;

public class Layout {

  private final String groupName;
  private final Map<String, Node> nodes;
  private final Map<GenePair, Edge> edges;

  public Layout(String groupName) {
    this.groupName = groupName;
    this.edges = new HashMap<>();
    this.nodes = new HashMap<>();
  }
  
  public String getGroupName() {
    return groupName;
  }
  
  public Collection<Edge> getEdges() {
    return edges.values();
  }
  
  public void addEdge(Edge edge) {
    this.edges.put(edge, edge);
  }
  
  public Collection<Node> getNodes() {
    return nodes.values();
  }
  
  public Node getNode(String sourceId) {
    return nodes.get(sourceId);
  }
  
  public void addNode(Node node) {
    this.nodes.put(node.getGene().getSourceId(), node);
  }
}
