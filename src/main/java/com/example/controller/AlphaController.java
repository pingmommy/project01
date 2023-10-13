package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import util.Alpha;
import util.Color;

@Slf4j
@Controller
@RequestMapping("/alpha")
public class AlphaController {

// 배열로도 만들어보고 맵으로도 만들어 봐라 
// Arraylist ...
	
	@GetMapping("/fill")
	void fill(Model model) {
	
		/*
		 * var rect = new ArrayList<ArrayList<Alpha>>();
		 */		
//	ArrayList로 작성
//		for(int i =0; i<20; i++) {
//			rect.add(new ArrayList<Alpha>());
//			for(int j=0; j<40; j++) {
//				rect.get(i).add(new Alpha());
//			}
//		}
	  
//  배열로 작성 	  
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
	
	
	//Rest(representation state transfer) API
	@ResponseBody
	@GetMapping("/data")
	Alpha date() {
		return new Alpha();  // Alpha를 리턴하니까 Alpha타입으로 메소드를 만든다. 
	}
	
	@GetMapping("/race")
	void race(Model model) {
		var rect = new ArrayList<ArrayList<Alpha>>();
		
		for(var i =0; i<20; i++) {
				rect.add(new ArrayList<Alpha>());
			for(var j =0; j<40; j++) {
				rect.get(i).add(new Alpha());
			}
		}
		model.addAttribute("surface", rect);
	}
	
	@ResponseBody
	@GetMapping("/racing")
	Alpha racing() {

		return new Alpha();
	}
	
	
	@GetMapping("/cross")
	void cross(Model model) {
		var alphas = new HashMap<Integer, ArrayList<Alpha>>();
		
		for( var i =0; i<20; i++) {
			alphas.put(i, new ArrayList<Alpha>());
			for(var j = 0; j<40;j++) {
				alphas.get(i).add(new Alpha());
			}
		}
		
		model.addAttribute("surface", alphas);
	}
	
	
	@GetMapping("/zigzag")
	void zigzag(Model model) {
		var alphas = new HashSet< ArrayList<Alpha>>();
		
		for(var i =0; i<20; i++) {
			var list =  new ArrayList<Alpha>();
			
			for(var j =0; j<40; j++) {
				list.add(new Alpha());
			}
			alphas.add(list);
		}
	
	
		
		model.addAttribute("surface", alphas);
	}
	
	
	@GetMapping("/earthworm")
	void earthworm(Model model) {
		var alphas = new ArrayList<ArrayList<Alpha>>();
		
		for(var i =0; i<20; i++) {
			alphas.add(new ArrayList<Alpha>());
			for(var j =0; j<40; j++) {
				alphas.get(i).add(new Alpha());
			}
			
			model.addAttribute("surface", alphas);
		}
	}


}
