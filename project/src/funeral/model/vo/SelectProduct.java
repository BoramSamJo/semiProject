package funeral.model.vo;

import java.io.Serializable;

public class SelectProduct implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1344263971260981002L;
	private String selectCode;
	private String selectShroud;
	private String selectCoffin;
	private String selectCremation;
	public SelectProduct() {
		super();
	}
	public SelectProduct(String selectCode, String selectShroud, String selectCoffin, String selectCremation) {
		super();
		this.selectCode = selectCode;
		this.selectShroud = selectShroud;
		this.selectCoffin = selectCoffin;
		this.selectCremation = selectCremation;
	}
	
	public SelectProduct(String selectShroud, String selectCoffin, String selectCremation) {
		super();
		this.selectShroud = selectShroud;
		this.selectCoffin = selectCoffin;
		this.selectCremation = selectCremation;
	}
	
	public String getSelectCode() {
		return selectCode;
	}
	public void setSelectCode(String selectCode) {
		this.selectCode = selectCode;
	}
	public String getSelectShroud() {
		return selectShroud;
	}
	public void setSelectShroud(String selectShroud) {
		this.selectShroud = selectShroud;
	}
	public String getSelectCoffin() {
		return selectCoffin;
	}
	public void setSelectCoffin(String selectCoffin) {
		this.selectCoffin = selectCoffin;
	}
	public String getSelectCremation() {
		return selectCremation;
	}
	public void setSelectCremation(String selectCremation) {
		this.selectCremation = selectCremation;
	}
	@Override
	public String toString() {
		return "SelectProduct [selectCode=" + selectCode + ", selectShroud=" + selectShroud + ", selectCoffin="
				+ selectCoffin + ", selectCremation=" + selectCremation + "]";
	}
	
	
}
