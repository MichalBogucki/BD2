package bd2.controllers;

import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl implements InfoService {
	@Override
	public String getMsg() {
		return "Message: ";
	}
}
