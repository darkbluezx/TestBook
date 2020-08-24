package _05_loginSystem.validate;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _05_loginSystem.model.Members;
@Component
public class MembersValidator implements Validator {
private static final Pattern PHONE_REGEX = Pattern.compile("^[0][9][0-9]{8}$");
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Members.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Members mb = (Members) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "", "電話欄不能空白");
		if (mb.getPhone().length()<10 && !PHONE_REGEX.matcher(mb.getPhone()).matches()) {
			errors.rejectValue("phone","", "不符合手機號格式");
		}

	}

}
