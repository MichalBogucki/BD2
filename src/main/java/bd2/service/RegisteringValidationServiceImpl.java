package bd2.service;

import bd2.business.ErrorCodes;
import bd2.entities.UserLogin;
import bd2.entities.helpers.RegistrationUser;
import bd2.service.api.RegisteringValidationSerivce;
import bd2.service.api.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class RegisteringValidationServiceImpl implements RegisteringValidationSerivce {

	@Autowired
	private UserLoginService userLoginService;

	private Pattern pattern;
	private Matcher matcher;
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	private static final String STRING_FIELD_PATTERN = "^[a-zA-Z]+$";

	private static final String PHONE_PATTERN = "^\\d{9}$";

	private static final String BUILDING_OR_FLAT_NUMBER_PATTERN = "^\\d{0,5}$";

	private static final String PESEL_PATTERN = "^\\d{11}$";

	private static final int PASSWORD_MIN_SIZE = 6;

	private static final int PASSWORD_MAX_SIZE = 30;

	private boolean isEmailValid(final String email) {
		pattern = Pattern.compile(EMAIL_PATTERN);
		if (email == null) {
			return false;
		}
		matcher = pattern.matcher(email);
		return matcher.matches();
	}

	private boolean isBuildingOrFlatNumberValid(final String buildingNumber) {
		pattern = Pattern.compile(BUILDING_OR_FLAT_NUMBER_PATTERN);
		if (buildingNumber == null) {
			return false;
		}
		matcher = pattern.matcher(buildingNumber);
		return matcher.matches();
	}

	private boolean isPhoneNumberValid(final String phoneNumber) {
		pattern = Pattern.compile(PHONE_PATTERN);
		if (phoneNumber == null) {
			return false;
		}
		matcher = pattern.matcher(phoneNumber);
		return matcher.matches();
	}

	private boolean isPeselValid(final String pesel) {
		pattern = Pattern.compile(PESEL_PATTERN);
		if (pesel == null) {
			return false;
		}
		matcher = pattern.matcher(pesel);
		return matcher.matches();
	}

	private boolean isStringFieldValid(final String field) {
		pattern = Pattern.compile(STRING_FIELD_PATTERN);
		if (field == null) {
			return false;
		}
		matcher = pattern.matcher(field);
		return matcher.matches();
	}

	public void validateRegistrationUser(BindingResult result) {
		validateLogin(result);
		validateStringFields(result);
		validateEmail(result);
		validatePassword(result);
		validateBirthDate(result);
		validatePesel(result);
		validatePhoneNumber(result);
		validateBuildingNumber(result);
		validateFlatNumber(result);
	}

	private void validateLogin(BindingResult result) {
		String login = (String) result.getRawFieldValue("login");
		if(login.isEmpty()) {
			result.rejectValue("login", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}

		UserLogin existingUserLogin = userLoginService.getUserLoginByLogin(login);
		checkLoginUsage(result, existingUserLogin);

		String email = (String) result.getRawFieldValue("email");
		if(!isEmailValid(email)) {
			return;
		}

		existingUserLogin = userLoginService.getUserLoginByEmail(email);
		checkEmailUsage(result, existingUserLogin);
	}

	private void validateBuildingNumber(BindingResult result) {
		String buildingNumber = (String) result.getRawFieldValue("buildingNumber");
		if(buildingNumber.isEmpty()) {
			result.rejectValue("buildingNumber", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}
		if(!isBuildingOrFlatNumberValid(buildingNumber)) {
			result.rejectValue("buildingNumber", ErrorCodes.WRONG_FORMAT_ERRORCODE);
		}
	}

	private void validateFlatNumber(BindingResult result) {
		String flatNumber = (String) result.getRawFieldValue("flatNumber");
		if(flatNumber.isEmpty()) {
			result.rejectValue("flatNumber", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}
		if(!isBuildingOrFlatNumberValid(flatNumber)) {
			result.rejectValue("flatNumber", ErrorCodes.WRONG_FORMAT_ERRORCODE);
		}
	}

	private void checkEmailUsage(BindingResult result, UserLogin existingUserLogin) {
		if(existingUserLogin != null) {
			result.rejectValue("email", ErrorCodes.EMAIL_EXISTS_ERRORCODE);
		}
	}

	private void checkLoginUsage(BindingResult result, UserLogin existingUserLogin) {
		if(existingUserLogin != null) {
			result.rejectValue("login", ErrorCodes.LOGIN_EXISTS_ERRORCODE);
		}
	}

	private void validateEmail(BindingResult result) {
		String email = (String) result.getRawFieldValue("email");
		if(!isEmailValid(email)) {
			result.rejectValue("email", ErrorCodes.EMAIL_ERRORCODE);
		}
	}

	private void validatePhoneNumber(BindingResult result) {
		String phoneNumber = (String) result.getRawFieldValue("phoneNumber");
		if(phoneNumber.isEmpty()) {
			result.rejectValue("phoneNumber", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}
		if(!isPhoneNumberValid(phoneNumber)) {
			result.rejectValue("phoneNumber", ErrorCodes.WRONG_FORMAT_ERRORCODE);
		}
	}

	private void validatePesel(BindingResult result) {
		String pesel = (String) result.getRawFieldValue("pesel");
		if(pesel.isEmpty()) {
			result.rejectValue("pesel", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}
		if(!isPeselValid(pesel)) {
			result.rejectValue("pesel", ErrorCodes.WRONG_FORMAT_ERRORCODE);
		}

	}

	private void validateBirthDate(BindingResult result) {
		String birthDateString = (String) result.getRawFieldValue("birthDate");
		if(birthDateString.isEmpty()) {
			result.rejectValue("birthDate", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate birthDate = LocalDate.parse(birthDateString, formatter);

		if(birthDate == null) {
			result.rejectValue("birthDate", ErrorCodes.WRONG_FORMAT_ERRORCODE);
			return;
		}

		if(birthDate.isAfter(LocalDate.now())) {
			result.rejectValue("birthDate", ErrorCodes.DATE_AFTER_TODAY_ERRORCODE);
			return;
		}
	}

	private void validatePassword(BindingResult result) {
		String password = (String) result.getRawFieldValue("password");
		String matchingPassword = (String) result.getRawFieldValue("matchingPassword");

		if(password.isEmpty()) {
			result.rejectValue("password", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
		}

		if(matchingPassword.isEmpty()) {
			result.rejectValue("matchingPassword", ErrorCodes.FIELD_REQUIRED_ERRORCODE);
			return;
		}

		if(!password.equals(matchingPassword)) {
			result.rejectValue("matchingPassword", ErrorCodes.PASSWORD_MATCHING_ERRORCODE);
		}

		if(password.length() > PASSWORD_MAX_SIZE || password.length() < PASSWORD_MIN_SIZE) {
			result.rejectValue("password", ErrorCodes.PASSWORD_LENGTH_ERRORCODE);
		}
	}

	private void validateStringFields(BindingResult result) {
		RegistrationUser.stringFieldsList.forEach(field -> {
			String fieldValue = (String) result.getRawFieldValue(field);
			if(fieldValue.isEmpty()) {
				result.rejectValue(field, ErrorCodes.FIELD_REQUIRED_ERRORCODE);
				return;
			}
			if(!isStringFieldValid(fieldValue)) {
				result.rejectValue(field, ErrorCodes.STRING_FIELD_FORMAT_ERRORCODE);
			}
		});
	}
}
