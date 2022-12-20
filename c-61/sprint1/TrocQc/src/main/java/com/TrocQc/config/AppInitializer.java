package com.TrocQc.config;

/* Class AppInitializer
 * Auteur: Spring
 * Équipe: William et Korallia 
 * Ce fichier est auto-généré par spring pour gérer l'app
 */


import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;




public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
 
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { SpringJdbcConfig.class };
		
	}
 
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebMvcConfig.class };
	}
 
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
 
}





