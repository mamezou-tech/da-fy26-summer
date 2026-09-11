package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReserverServiceMenuController {
	
	 @GetMapping("/reserver")
	    public String reserver() {
	        return "reserver";
	    }

}
