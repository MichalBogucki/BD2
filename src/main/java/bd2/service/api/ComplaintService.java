package bd2.service.api;

import bd2.entities.Complaint;

import java.util.List;

public interface ComplaintService {

	List<Complaint> getComplaints();

	void saveComplaint(Complaint complaint);

	Complaint getComplaint(int id);

	void deleteComplaint(int id);
}
