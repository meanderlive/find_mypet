package com.example.findmypet.findmypet.pets.dto;

import jakarta.validation.constraints.NotBlank;

import java.time.LocalDate;

public class PetRequest {
    @NotBlank
    private String name;
    @NotBlank
    private String species;
    private String breed;
    private String color;
    private String gender;
    @NotBlank
    private String lastSeenLocation;
    private LocalDate lastSeenDate;
    private String photoUrl;

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSpecies() { return species; }
    public void setSpecies(String species) { this.species = species; }
    public String getBreed() { return breed; }
    public void setBreed(String breed) { this.breed = breed; }
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getLastSeenLocation() { return lastSeenLocation; }
    public void setLastSeenLocation(String lastSeenLocation) { this.lastSeenLocation = lastSeenLocation; }
    public LocalDate getLastSeenDate() { return lastSeenDate; }
    public void setLastSeenDate(LocalDate lastSeenDate) { this.lastSeenDate = lastSeenDate; }
    public String getPhotoUrl() { return photoUrl; }
    public void setPhotoUrl(String photoUrl) { this.photoUrl = photoUrl; }
}


