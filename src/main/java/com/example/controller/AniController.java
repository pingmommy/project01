package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Alpha;
import util.Color;

@Controller
@RequestMapping("/ani")
public class AniController {

	@GetMapping("/fill")
	void fill(Model model) {
		Alpha[][] alphas = new Alpha[20][40];
		  
		  for(var i=0; i<alphas.length;i++) {
			  for(var j=0; j<alphas[i].length;j++) {
				  alphas[i][j]=new Alpha();
				  alphas[i][j].setBg(Color.Black);
				  alphas[i][j].setFg(Color.Black);
			  }
		  }
		  
		  model.addAttribute("surface",alphas);
		
		
	}
	
	@GetMapping("/cross")
	void race(Model model) {
		Alpha[][] alphas = new Alpha[20][40];
		  
		  for(var i=0; i<alphas.length;i++) {
			  for(var j=0; j<alphas[i].length;j++) {
				  alphas[i][j]=new Alpha();
				  alphas[i][j].setBg(Color.Black);
				  alphas[i][j].setFg(Color.Black);
			  }
		  }
		  
		  model.addAttribute("surface",alphas);
		
		
	}
	
}
