package bd2.rest;

import bd2.entity.Student;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/api")
public class StudentRestController {

	private List<Student> students;

	@PostConstruct
	public void loadData() {
		this.students = Arrays.asList(
				new Student("Poornima", "Patel"),
				new Student("Mario", "Rossi"),
				new Student("Mary", "Smith")
		);
	}

	@GetMapping("/students")
	public List<Student> getStudents() {
		return students;
	}

	@GetMapping("/students/{studentId}")
	public Student getStudent(@PathVariable int studentId) {
		if(studentId >= students.size() || studentId < 0) {
			throw new StudentNotFoundException("Student with id: " + studentId + " not found.");
		}
		return students.get(studentId);
	}
}
