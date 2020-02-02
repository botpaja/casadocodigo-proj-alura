package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.models.Pedidos;

@Controller
@RequestMapping("/pedidos")
public class PedidosServicoController {
	
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listarPedidos() {
		String url = "https://book-payment.herokuapp.com/orders";
		Pedidos[] pedidos = restTemplate.getForObject(url, Pedidos[].class);
		ModelAndView modelAndView = new ModelAndView("/carrinho/pedidos");
		
		modelAndView.addObject("pedidos", pedidos);
		
		return modelAndView;
	}
	
	

}
