package bd2.service;

import bd2.dao.api.TicketCollectorDAO;
import bd2.entities.TicketCollector;
import bd2.service.api.TicketCollectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class TicketCollectorServiceImpl implements TicketCollectorService {

	@Autowired
	private TicketCollectorDAO ticketCollectorDAO;

	@Override
	@Transactional
	public List<TicketCollector> getTicketCollectors() {
		return ticketCollectorDAO.getTicketCollectors();
	}

	@Override
	@Transactional
	public void saveTicketCollector(TicketCollector ticketCollector) {
		ticketCollectorDAO.saveTicketCollector(ticketCollector);
	}

	@Override
	@Transactional
	public TicketCollector getTicketCollector(int id) {
		return ticketCollectorDAO.getTicketCollector(id);
	}

	@Override
	@Transactional
	public void deleteTicketCollector(int id) {
		ticketCollectorDAO.deleteTicketCollector(id);
	}
}
