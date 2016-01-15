package com.accp.crm.pojo;
/**
 * 客户类
 * @author 侯汉荣
 *
 */
@SuppressWarnings("serial")
public class CustInfo  implements java.io.Serializable {


    // Fields    
	 private Integer id;
     private String custno = "";
     private String name = "";
     private String region = "";
     private String custManager = "";
     private String levelLabel = "";
     private String satisfy;
     private String credit;
     private String custAddr;
     private String zip;
     private String tel;
     private String fax;
     private String website;
     private String licence;
     private String chieftain;
     private Integer bankroll;
     private Integer turnover;
     private String bank;
     private String account;
     private String localTax;
     private String nationalTax;
     private Integer status;


    // Constructors

    /** default constructor */
    public CustInfo() {
    }
    
    public CustInfo(String levelLabel, long status) {
		super();
		this.levelLabel = levelLabel;
		this.status = (int)status;
	}

	/** full constructor */
    public CustInfo(Integer id,String custno,String name, String region, String custManager,String levelLabel, String satisfy, String credit, String custAddr, String zip, String tel, String fax, String website, String licence, String chieftain, Integer bankroll, Integer turnover, String bank, String account, String localTax, String nationalTax, Integer status) {
        this.id = id;
        this.custno = custno;
        this.name = name;
        this.region = region;
        this.custManager = custManager;
        this.levelLabel = levelLabel;
        this.satisfy = satisfy;
        this.credit = credit;
        this.custAddr = custAddr;
        this.zip = zip;
        this.tel = tel;
        this.fax = fax;
        this.website = website;
        this.licence = licence;
        this.chieftain = chieftain;
        this.bankroll = bankroll;
        this.turnover = turnover;
        this.bank = bank;
        this.account = account;
        this.localTax = localTax;
        this.nationalTax = nationalTax;
        this.status = status;
    }

   
    // Property accessors
    
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
    public String getCustno() {
        return this.custno;
    }
    
	public void setCustno(String custno) {
        this.custno = custno;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getRegion() {
        return this.region;
    }
    
    public void setRegion(String region) {
        this.region = region;
    }

    public String getCustManager() {
        return this.custManager;
    }
    
    public void setCustManager(String custManager) {
        this.custManager = custManager;
    }

    public String getLevelLabel() {
        return this.levelLabel;
    }
    
    public void setLevelLabel(String levelLabel) {
        this.levelLabel = levelLabel;
    }

    public String getSatisfy() {
        return this.satisfy;
    }
    
    public void setSatisfy(String satisfy) {
        this.satisfy = satisfy;
    }

    public String getCredit() {
        return this.credit;
    }
    
    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getCustAddr() {
        return this.custAddr;
    }
    
    public void setCustAddr(String custAddr) {
        this.custAddr = custAddr;
    }

    public String getZip() {
        return this.zip;
    }
    
    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getTel() {
        return this.tel;
    }
    
    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getFax() {
        return this.fax;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getWebsite() {
        return this.website;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }

    public String getLicence() {
        return this.licence;
    }
    
    public void setLicence(String licence) {
        this.licence = licence;
    }

    public String getChieftain() {
        return this.chieftain;
    }
    
    public void setChieftain(String chieftain) {
        this.chieftain = chieftain;
    }

    public Integer getBankroll() {
        return this.bankroll;
    }
    
    public void setBankroll(Integer bankroll) {
        this.bankroll = bankroll;
    }

    public Integer getTurnover() {
        return this.turnover;
    }
    
    public void setTurnover(Integer turnover) {
        this.turnover = turnover;
    }

    public String getBank() {
        return this.bank;
    }
    
    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getAccount() {
        return this.account;
    }
    
    public void setAccount(String account) {
        this.account = account;
    }

    public String getLocalTax() {
        return this.localTax;
    }
    
    public void setLocalTax(String localTax) {
        this.localTax = localTax;
    }

    public String getNationalTax() {
        return this.nationalTax;
    }
    
    public void setNationalTax(String nationalTax) {
        this.nationalTax = nationalTax;
    }

    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
   
}