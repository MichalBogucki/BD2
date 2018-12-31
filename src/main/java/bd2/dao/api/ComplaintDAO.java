package bd2.dao.api;

import bd2.entities.Complaint;

import java.util.List;

public interface ComplaintDAO {

	List<Complaint> getComplaints();

	void saveComplaint(Complaint complaint);

	Complaint getComplaint(int id);

	void deleteComplaint(int id);

}
