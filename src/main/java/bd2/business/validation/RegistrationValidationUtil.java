package bd2.business.validation;

import bd2.business.ErrorCodes;
import bd2.entities.helpers.RegistrationUser;
import org.springframework.validation.BindingResult;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegistrationValidationUtil {

	private static Pattern pattern;
	private static Matcher matcher;
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	private static final String STRING_FIELD_PATTERN = "^[a-zA-Z]+$";

	public static boolean isEmailValid(final String email) {
		pattern = Pattern.compile(EMAIL_PATTERN);
		if (email == null) {
			return false;
		}
		matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public static boolean isStringFieldValid(final String field) {
		pattern = Pattern.compile(STRING_FIELD_PATTERN);
		if (field == null) {
			return false;
		}
		matcher = pattern.matcher(field);
		return matcher.matches();
	}

	public static void validateRegistrationUser(BindingResult result) {
		validateStringFields(result);
		validateEmail(result);
		validatePassword(result);
	}

	public static void validateEmail(BindingResult result) {
		String email = (String) result.getRawFieldValue("email");
		if(!isEmailValid(email)) {
			result.rejectValue("email", ErrorCodes.EMAIL_ERRORCODE);
		}
	}

	public static void validatePassword(BindingResult result) {
		String password = (String) result.getRawFieldValue("password");
		String matchingPassword = (String) result.getRawFieldValue("matchingPassword");

		if(password == null || password.isEmpty()) {
			result.rejectValue("password", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
		}

		if(matchingPassword == null || matchingPassword.isEmpty()) {
			result.rejectValue("matchingPassword", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}

		if(!password.equals(matchingPassword)) {
			result.rejectValue("matchingPassword", ErrorCodes.PASSWORD_MATCHING_ERRORCODE);
		}

		if(password.length() > 12 || password.length() < 3) {
			result.rejectValue("password", ErrorCodes.PASSWORD_LENGTH_ERRORCODE);
		}
	}

	public static void validateStringFields(BindingResult result) {
		RegistrationUser.stringFieldsList.forEach(field -> {
			String fieldValue = (String) result.getRawFieldValue(field);
			if(fieldValue == null || fieldValue.isEmpty()) {
				result.rejectValue(field, ErrorCodes.FIELD_REQUIRED_ERRORCODE);
				return;
			}
			if(!isStringFieldValid(fieldValue)) {
				result.rejectValue(field, ErrorCodes.STRING_FIELD_FORMAT_ERRORCODE);
			}
		});
	}
}
