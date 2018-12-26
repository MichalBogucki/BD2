package bd2.controllers;

import org.springframework.security.access.prepost.PreAuthorize;

public interface InfoService {
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_PASSENGER')")
	String getMsg();
}
