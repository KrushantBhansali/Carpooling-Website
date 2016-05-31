package com.me.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import com.me.nodel.Payment;

public class PaymentValidator implements Validator  {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Payment.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Payment payment = (Payment)target;
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cardholderName", "validate.cardholderName", "Field Cannot be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cardType", "validate.cardType", "Field Cannot be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cardNo", "validate.cardNo", "Field Cannot be Empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cardExpiry", "validate.cardExpiry", "Field Cannot be Empty");
	}

}
