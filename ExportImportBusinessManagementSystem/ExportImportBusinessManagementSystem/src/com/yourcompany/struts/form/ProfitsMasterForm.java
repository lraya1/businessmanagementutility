package com.yourcompany.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class ProfitsMasterForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** cityMap property */
	private String cityMap;

	/** description property */
	private String description;
	private String countryname;
	private String cityMap1;
	/** cityId property */
	private int cityId;

	/** abbr property */
	private String abbr;

	/** countryId property */
	private int countryId;

	/** cityName property */
	private String cityName;

	/*
	 * Generated Methods
	 */

	/**
	 * Method validate
	 * 
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Method reset
	 * 
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/**
	 * Returns the cityMap.
	 * 
	 * @return String
	 */
	public String getCityMap() {
		return cityMap;
	}

	/**
	 * Set the cityMap.
	 * 
	 * @param cityMap
	 *            The cityMap to set
	 */
	public void setCityMap(String cityMap) {
		this.cityMap = cityMap;
	}

	/**
	 * Returns the description.
	 * 
	 * @return String
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Set the description.
	 * 
	 * @param description
	 *            The description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Returns the cityId.
	 * 
	 * @return int
	 */
	public int getCityId() {
		return cityId;
	}

	/**
	 * Set the cityId.
	 * 
	 * @param cityId
	 *            The cityId to set
	 */
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	/**
	 * Returns the abbr.
	 * 
	 * @return String
	 */
	public String getAbbr() {
		return abbr;
	}

	/**
	 * Set the abbr.
	 * 
	 * @param abbr
	 *            The abbr to set
	 */
	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}

	/**
	 * Returns the countryId.
	 * 
	 * @return int
	 */
	public int getCountryId() {
		return countryId;
	}

	/**
	 * Set the countryId.
	 * 
	 * @param countryId
	 *            The countryId to set
	 */
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	/**
	 * Returns the cityName.
	 * 
	 * @return String
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * Set the cityName.
	 * 
	 * @param cityName
	 *            The cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountryname() {
		return countryname;
	}

	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}

	public String getCityMap1() {
		return cityMap1;
	}

	public void setCityMap1(String cityMap1) {
		this.cityMap1 = cityMap1;
	}
}
