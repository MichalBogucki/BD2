package bd2.service;

import bd2.dao.api.ComplaintStatusDAO;
import bd2.entities.meta.ComplaintStatus;
import bd2.service.api.ComplaintStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComplaintStatusServiceImpl implements ComplaintStatusService {

	@Autowired
	ComplaintStatusDAO complaintStatusDAO;

	@Override
	public ComplaintStatus getComplaintStatus(int id) {
		return complaintStatusDAO.getComplaintStatus(id);
	}
}
