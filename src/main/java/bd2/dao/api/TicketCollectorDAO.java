package bd2.dao.api;

import bd2.entities.TicketCollector;

import java.util.List;

public interface TicketCollectorDAO {

	List<TicketCollector> getTicketCollectors();

	void saveTicketCollector(TicketCollector ticketCollector);

	TicketCollector getTicketCollector(int id);

	void deleteTicketCollector(int id);
}
