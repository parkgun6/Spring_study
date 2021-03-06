package org.geon.common.config;


import org.geon.board.config.BoardConfig;
import org.geon.time.config.TimeConfig;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//이 파일은 웬만하면 건드리지 않는다.
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		//웬만하면 각 패키지의 컨피그파일은 여기에 넣어준다.
		return new Class[] {
				CommonConfig.class, 
				TimeConfig.class, 
				BoardConfig.class
				};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };	
	}

}
