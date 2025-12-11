package com.example.findmypet.findmypet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;

import com.example.findmypet.findmypet.users.UserService;
import com.example.findmypet.findmypet.pets.PetService;
import com.example.findmypet.findmypet.pets.dto.PetRequest;

import java.time.LocalDate;

@SpringBootApplication
public class FindmypetApplication {

	public static void main(String[] args) {
		SpringApplication.run(FindmypetApplication.class, args);
	}

	@Bean
	CommandLineRunner seed(UserService userService, PetService petService) {
		return args -> {
			try {
				var user = userService.createUser("Test User", "test@example.com", "password123");
				PetRequest r = new PetRequest();
				r.setName("Buddy");
				r.setSpecies("Dog");
				r.setBreed("Labrador");
				r.setColor("Brown");
				r.setGender("Male");
				r.setLastSeenLocation("Central Park");
				r.setLastSeenDate(LocalDate.now().minusDays(2));
				r.setPhotoUrl("https://example.com/photo.jpg");
				petService.createPet(user.getEmail(), r);
			} catch (Exception ignored) {
			}
		};
	}
}
