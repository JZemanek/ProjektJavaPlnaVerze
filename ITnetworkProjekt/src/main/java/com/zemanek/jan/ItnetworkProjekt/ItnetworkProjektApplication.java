package com.zemanek.jan.ItnetworkProjekt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

/**
 *
 * @author janze
 */
@SpringBootApplication
@EntityScan("com.zemanek.jan.ItnetworkProjekt.entity")
public class ItnetworkProjektApplication {

    /**
     * Main třída
     * @param args
     */
    public static void main(String[] args) {
		SpringApplication.run(ItnetworkProjektApplication.class, args);
	}

}
