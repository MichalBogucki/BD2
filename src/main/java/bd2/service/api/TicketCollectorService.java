package bd2.service.api;

import bd2.entities.TicketCollector;

import java.util.List;

public interface TicketCollectorService {

	List<TicketCollector> getTicketCollectors();

	void saveTicketCollector(TicketCollector passenger);

	TicketCollector getTicketCollector(int id);

	TicketCollector getTicketCollectorLazy(int id);

	void deleteTicketCollector(int id);
}
