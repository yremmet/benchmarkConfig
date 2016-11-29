package de.fhbingen.bin.hungrig.data;

import com.fasterxml.jackson.annotation.JsonValue;

public enum DishType {
	NORMAL,
	VEGETARIAN,
	VEGAN;
	
	@JsonValue
	public int toValue(){
		return this.ordinal();
	}
}