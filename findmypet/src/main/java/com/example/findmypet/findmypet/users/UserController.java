package com.example.findmypet.findmypet.users;

import com.example.findmypet.findmypet.pets.PetService;
import com.example.findmypet.findmypet.pets.dto.PetResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {
    private final PetService petService;

    public UserController(PetService petService) {
        this.petService = petService;
    }

    @GetMapping("/me/pets")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<PetResponse>> myPets(Authentication authentication) {
        return ResponseEntity.ok(petService.listByOwner(authentication.getName()));
    }
}


