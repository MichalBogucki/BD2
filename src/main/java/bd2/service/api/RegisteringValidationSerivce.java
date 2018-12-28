package bd2.service.api;

import org.springframework.validation.BindingResult;

public interface RegisteringValidationSerivce {
	void validateRegistrationUser(BindingResult result);
}
