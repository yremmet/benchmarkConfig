package de.evoila.benchmarking;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Configuration {

	public String getPerformanceKitPath() {
		return performanceKitPath;
	}

	@Value("${performanceKit.path}")
	private String performanceKitPath;
		


}
