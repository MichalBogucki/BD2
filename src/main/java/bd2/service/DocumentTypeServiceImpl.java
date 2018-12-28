package bd2.service;

import bd2.dao.api.DocumentTypeDAO;
import bd2.entities.meta.DocumentType;
import bd2.service.api.DocumentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentTypeServiceImpl implements DocumentTypeService {

	@Autowired
	private DocumentTypeDAO documentTypeDAO;

	@Override
	public DocumentType getDocumentType(int id) {
		return documentTypeDAO.getDocumentType(id);
	}
}
