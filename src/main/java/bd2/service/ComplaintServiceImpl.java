package bd2.service;

import bd2.dao.api.ComplaintDAO;
import bd2.entities.Complaint;
import bd2.service.api.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	@Autowired
	ComplaintDAO complaintDAO;

	@Override
	public List<Complaint> getComplaints() {
		return complaintDAO.getComplaints();
	}

	@Override
	public void saveComplaint(Complaint complaint) {
		complaintDAO.saveComplaint(complaint);
	}

	@Override
	public Complaint getComplaint(int id) {
		return complaintDAO.getComplaint(id);
	}

	@Override
	public void deleteComplaint(int id) {
		complaintDAO.deleteComplaint(id);
	}
}
