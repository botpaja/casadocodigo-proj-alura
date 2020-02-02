package br.com.casadocodigo.loja.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.Relatorio;

@Controller
@RequestMapping("/relatorio-produtos")
public class RelatorioProdutoController {
	
	@Autowired
	private ProdutoDAO produtoDao;

//	@RequestMapping(method=RequestMethod.GET)
//	@ResponseBody
//	public List<Produto> relatorioJson() {
//		
//		return produtoDao.listar();
//	}
//	
	@RequestMapping(method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Relatorio relatorioJsonComData(@RequestParam(value="data", required=false)String dataString) throws ParseException {
		Relatorio relatorio = new Relatorio();
		
		if(dataString == null) {
			relatorio.setProdutos(produtoDao.listar());
	        
	        relatorio.setQuantidade(relatorio.getProdutos().size());
	        relatorio.setDataGeracao(Calendar.getInstance());
			return relatorio;
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
        Date date = format.parse(dataString);
        
        Calendar dataProdutos = Calendar.getInstance();
        dataProdutos.setTime(date);
        
        dataProdutos.add(Calendar.MONTH	, 1);
        
        relatorio.setProdutos(produtoDao.listarComData(dataProdutos));
        
        relatorio.setQuantidade(relatorio.getProdutos().size());
        
        
        
        relatorio.setDataGeracao(Calendar.getInstance());
        
		return relatorio;
	}
	
	

	
}
