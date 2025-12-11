package com.example.findmypet.findmypet.pets;

import com.example.findmypet.findmypet.pets.dto.PetRequest;
import com.example.findmypet.findmypet.pets.dto.PetResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pets")
@Tag(name = "PET APIs",description = "List all,Create,Retrieve,Delete,Update")
public class PetController {
    private final PetService petService;

    public PetController(PetService petService) {
        this.petService = petService;
    }

    @GetMapping
    @Operation(description = "fetch all lost pets")
    public ResponseEntity<List<PetResponse>> listAll() {
        return ResponseEntity.ok(petService.listAll());
    }

    @PostMapping
    public ResponseEntity<PetResponse> create(@Valid @RequestBody PetRequest request, Authentication authentication) {
        String ownerEmail = authentication.getName();
        return ResponseEntity.ok(petService.createPet(ownerEmail, request));
    }

    @GetMapping("/me")
    public ResponseEntity<List<PetResponse>> myPets(Authentication authentication) {
        return ResponseEntity.ok(petService.listByOwner(authentication.getName()));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable String id, Authentication authentication) {
        petService.deletePet(id, authentication.getName());
        return ResponseEntity.noContent().build();
    }

    @PatchMapping("/{id}")
    public ResponseEntity<PetResponse> update(@PathVariable String id, @RequestBody PetRequest request, Authentication authentication) {
        return ResponseEntity.ok(petService.updatePet(id, authentication.getName(), request));
    }
}


