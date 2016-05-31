package com.me.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.nodel.Car;


public class CarValidator  implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Car.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
			// TODO Auto-generated method stub
			//Car car = (Car)target;
			
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "model", "validate.model", "Field Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "seats", "validate.seats", "Field Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "validate.type", "Field Cannot be Empty");

			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "carno", "validate.carno", "Field Cannot be Empty");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "color", "validate.color", "Field Cannot be Empty");
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "image", "validate.image", "Field Cannot be Empty");
		
	}

}


