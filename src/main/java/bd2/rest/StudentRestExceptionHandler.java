package bd2.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

//@ControllerAdvice
public class StudentRestExceptionHandler {

	//@ExceptionHandler
	public ResponseEntity<StudentErrorResponse> handleException(StudentNotFoundException exc) {
		StudentErrorResponse errorResponse = new StudentErrorResponse();
		errorResponse.setMessage(exc.getMessage());
		errorResponse.setStatus(HttpStatus.NOT_FOUND.value());
		errorResponse.setTimeStamp(System.currentTimeMillis());
		return new ResponseEntity<> (errorResponse, HttpStatus.NOT_FOUND);
	}

	//@ExceptionHandler
	public ResponseEntity<StudentErrorResponse> handleException(Exception exc) {
		StudentErrorResponse errorResponse = new StudentErrorResponse();
		errorResponse.setMessage(exc.getMessage());
		errorResponse.setStatus(HttpStatus.BAD_REQUEST.value());
		errorResponse.setTimeStamp(System.currentTimeMillis());
		return new ResponseEntity<> (errorResponse, HttpStatus.BAD_REQUEST);
	}
}
