package com.me.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.nodel.User;

public class SignUpValidator implements Validator
{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User u = (User) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "validate.username","Username cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "validate.password","Password cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "image", "validate.image","Image cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "validate.fname","First Name cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "validate.lname","Last Name cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "validate.age","Age cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "validate.email","Email cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "validate.phone","Phone cannot be empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "image", "validate.image","Image cannot be empty");
	}

}
