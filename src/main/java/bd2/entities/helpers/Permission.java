package bd2.entities.helpers;

public enum Permission {

	ROLE_WORKER("ROLE_WORKER"),
	ROLE_COLLECTOR("ROLE_COLLECTOR"),
	ROLE_ADMIN("ROLE_ADMIN"),
	ROLE_PASSENGER("ROLE_PASSENGER"),
	ROLE_TEST("ROLE_TEST");

	private String role;

	Permission(String role) {
		this.role = role;
	}

	public String role() {
		return this.role;
	}
}
