package _05_loginSystem.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _05_loginSystem.model.LoginBean;


public class LoginBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return LoginBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {//whitespace == tab enter space
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "", "手機欄不能為空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "", "密碼欄不能為空白");
	}

}
