package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="Payroll")
public class Payroll {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="payrollId")
	private int id;
}
