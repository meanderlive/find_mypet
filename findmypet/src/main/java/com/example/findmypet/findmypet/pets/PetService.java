package com.example.findmypet.findmypet.pets;

import com.example.findmypet.findmypet.pets.dto.PetRequest;
import com.example.findmypet.findmypet.pets.dto.PetResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PetService {
    private final PetRepository petRepository;

    public PetService(PetRepository petRepository) {
        this.petRepository = petRepository;
    }

    public PetResponse createPet(String ownerId, PetRequest request) {
        Pet pet = new Pet();
        pet.setName(request.getName());
        pet.setSpecies(request.getSpecies());
        pet.setBreed(request.getBreed());
        pet.setColor(request.getColor());
        pet.setGender(request.getGender());
        pet.setLastSeenLocation(request.getLastSeenLocation());
        pet.setLastSeenDate(request.getLastSeenDate());
        pet.setPhotoUrl(request.getPhotoUrl());
        pet.setOwnerId(ownerId);
        pet = petRepository.save(pet);
        return toResponse(pet);
    }

    public List<PetResponse> listAll() {
        return petRepository.findAll().stream().map(this::toResponse).collect(Collectors.toList());
    }

    public List<PetResponse> listByOwner(String ownerId) {
        return petRepository.findByOwnerId(ownerId).stream().map(this::toResponse).collect(Collectors.toList());
    }

    public void deletePet(String petId, String ownerId) {
        Pet pet = petRepository.findById(petId).orElseThrow(() -> new IllegalArgumentException("Pet not found"));
        if (!pet.getOwnerId().equals(ownerId)) {
            throw new SecurityException("Not authorized to delete this pet");
        }
        petRepository.deleteById(petId);
    }

    public PetResponse updatePet(String petId, String ownerId, PetRequest request) {
        Pet pet = petRepository.findById(petId).orElseThrow(() -> new IllegalArgumentException("Pet not found"));
        if (!pet.getOwnerId().equals(ownerId)) {
            throw new SecurityException("Not authorized to update this pet");
        }
        if (request.getName() != null) pet.setName(request.getName());
        if (request.getSpecies() != null) pet.setSpecies(request.getSpecies());
        if (request.getBreed() != null) pet.setBreed(request.getBreed());
        if (request.getColor() != null) pet.setColor(request.getColor());
        if (request.getGender() != null) pet.setGender(request.getGender());
        if (request.getLastSeenLocation() != null) pet.setLastSeenLocation(request.getLastSeenLocation());
        if (request.getLastSeenDate() != null) pet.setLastSeenDate(request.getLastSeenDate());
        if (request.getPhotoUrl() != null) pet.setPhotoUrl(request.getPhotoUrl());
        pet = petRepository.save(pet);
        return toResponse(pet);
    }

    private PetResponse toResponse(Pet pet) {
        PetResponse r = new PetResponse();
        r.setId(pet.getId());
        r.setName(pet.getName());
        r.setSpecies(pet.getSpecies());
        r.setBreed(pet.getBreed());
        r.setColor(pet.getColor());
        r.setGender(pet.getGender());
        r.setLastSeenLocation(pet.getLastSeenLocation());
        r.setLastSeenDate(pet.getLastSeenDate());
        r.setPhotoUrl(pet.getPhotoUrl());
        r.setOwnerId(pet.getOwnerId());
        return r;
    }
}


