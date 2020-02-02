package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.RoleDAO;
import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;
import br.com.casadocodigo.loja.validation.UsuarioValidation;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioDAO usuarioDao;
	
	@Autowired
	private RoleDAO roleDao;
	
	@Autowired
    private UsuarioValidation usuarioValidation;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(usuarioValidation);
	}

	@RequestMapping("/form")
	public ModelAndView cadastra(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/usuario/form");

		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView gravar(@Valid Usuario usuario, BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return cadastra(usuario);
		}

		usuarioDao.gravar(usuario);

		redirectAttributes.addFlashAttribute("message", "Produto cadastrado com sucesso!");

		return new ModelAndView("redirect:/usuarios");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listarUsuarios() {
		ModelAndView modelAndView = new ModelAndView("/usuario/listaUsuarios");
		List<Usuario> usuarios = usuarioDao.listar();

		modelAndView.addObject("usuarios", usuarios);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public ModelAndView formRoleUsuario(@RequestParam String email) {
		
		ModelAndView modelAndView = new ModelAndView("/usuario/editar");
		
		Usuario usuario = usuarioDao.loadUserByUsername(email);
		modelAndView.addObject("usuarioParaEditar", usuario);
		modelAndView.addObject("roles", roleDao.listarRoles());
		
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST, params = "roles")
	public ModelAndView atualizaRole(Usuario usuarioParaEditar) {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios");
		System.out.println("---------------------------------------");
		System.out.println("---------------------------------------");
		System.out.println(usuarioParaEditar.getEmail());
		System.out.println(usuarioParaEditar.getRoles());
		
		Usuario usuarioEditado = usuarioDao.loadUserByUsername(usuarioParaEditar.getEmail());
		usuarioEditado.setRoles(usuarioParaEditar.getRoles());
		
		usuarioDao.editaRole(usuarioEditado);
		
		return modelAndView;
		
	}
	
}
