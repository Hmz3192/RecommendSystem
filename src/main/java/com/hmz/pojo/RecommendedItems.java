package com.hmz.pojo;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Map;

@XmlRootElement
public class RecommendedItems {
  private Long[] items = null;
  private Map similarity = null;

  public Map getSimilarity() {
    return similarity;
  }

  public void setSimilarity(Map similarity) {
    this.similarity = similarity;
  }

  public Long[] getItems() {
    return items;
  }
  public void setItems(Long[] items) {
    this.items = items;
  }
}
