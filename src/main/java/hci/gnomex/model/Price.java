package hci.gnomex.model;

import hci.dictionary.model.DictionaryEntry;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.hibernate.Session;
import org.hibernate.query.Query;


public class Price extends DictionaryEntry implements Serializable {
  private Integer    idPrice;
  private Integer    idPriceCategory;
  private String     name;
  private String     description;
  private BigDecimal unitPrice;
  private BigDecimal unitPriceExternalAcademic;
  private BigDecimal unitPriceExternalCommercial;
  private String     isActive;
  private Set        priceCriterias = new TreeSet();
  
  public String getDisplay() {
    String display = this.getNonNullString(getName());
    
    
    return display;
  }

  public String getValue() {
    return getIdPrice().toString();
  }


  
  public String getDescription() {
    return description;
  }

  
  public void setDescription(String description) {
    this.description = description;
  }

  
  
  
  public BigDecimal getUnitPrice() {
    return unitPrice;
  }

  
  
  public String getIsActive() {
    return isActive;
  }

  
  public void setIsActive(String isActive) {
    this.isActive = isActive;
  }

  
  public Integer getIdPrice() {
    return idPrice;
  }

  
  public void setIdPrice(Integer idPrice) {
    this.idPrice = idPrice;
  }

  
  public Integer getIdPriceCategory() {
    return idPriceCategory;
  }

  
  public void setIdPriceCategory(Integer idPriceCategory) {
    this.idPriceCategory = idPriceCategory;
  }

  
  public String getName() {
    return name;
  }

  
  public void setName(String name) {
    this.name = name;
  }

  
  public BigDecimal getUnitPriceExternalAcademic() {
    return unitPriceExternalAcademic;
  }
  
  public void setUnitPriceExternalAcademic(BigDecimal unitPriceExternalAcademic) {
    this.unitPriceExternalAcademic = unitPriceExternalAcademic;
  }

  
  public BigDecimal getUnitPriceExternalCommercial() {
    return unitPriceExternalCommercial;
  }
  
  public void setUnitPriceExternalCommercial(BigDecimal unitPriceExternalCommercial) {
    this.unitPriceExternalCommercial = unitPriceExternalCommercial;
  }

  
  public void setUnitPrice(BigDecimal unitPrice) {
    this.unitPrice = unitPrice;
  }
  
  
  public String getUnitPriceCurrency() {
    if (unitPrice != null) {
      return NumberFormat.getCurrencyInstance().format(unitPrice);
    } else {
      return "";
    }
  }
  
  
  public String getUnitPriceExternalAcademicCurrency() {
    if (unitPriceExternalAcademic != null) {
      return NumberFormat.getCurrencyInstance().format(unitPriceExternalAcademic);
    } else {
      return "";
    }
  }
  
  public String getUnitPriceExternalCommercialCurrency() {
    if (unitPriceExternalCommercial != null) {
      return NumberFormat.getCurrencyInstance().format(unitPriceExternalCommercial);
    } else {
      return "";
    }
  }

  
  public Set getPriceCriterias() {
    return priceCriterias;
  }

  
  public void setPriceCriterias(Set priceCriterias) {
    this.priceCriterias = priceCriterias;
  }
  
 public BigDecimal getEffectiveUnitPrice(Lab lab) {
   if (lab != null && lab.getIsExternalPricing() != null && lab.getIsExternalPricing().equalsIgnoreCase("Y")) {
     return unitPriceExternalAcademic;
   } else if (lab != null && lab.getIsExternalPricingCommercial() != null && lab.getIsExternalPricingCommercial().equalsIgnoreCase("Y")) {
       return unitPriceExternalCommercial;
   } else {
     return unitPrice;
   }
 }

 public static boolean hasBillingItems(Session sess, Integer idPrice ){

   boolean billingItem = false;

   String queryStr = "SELECT bi FROM BillingItem as bi WHERE bi.idPrice = :idPrice";
   Query query = sess.createQuery(queryStr)
           .setParameter("idPrice",idPrice);
   List billingItemList  =  query.list();


   if(billingItemList.size() > 0){
     billingItem = true;
   }

   return billingItem ;
  }
}