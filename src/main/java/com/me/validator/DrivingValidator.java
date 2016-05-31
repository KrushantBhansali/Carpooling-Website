package com.me.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.nodel.Driving;

public class DrivingValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Driving.class.equals(clazz) ;
	}

	@Override
	public void validate(Object arg0, Errors errors) {
		// TODO Auto-generated method stub
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "license", "validate.license", "Field Cannot be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "validity", "validate.validity", "Field Cannot be Empty");
	}

}
