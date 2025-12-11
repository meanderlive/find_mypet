package com.example.findmypet.findmypet.pets.dto;

import java.time.LocalDate;

public class PetResponse {
    private String id;
    private String name;
    private String species;
    private String breed;
    private String color;
    private String gender;
    private String lastSeenLocation;
    private LocalDate lastSeenDate;
    private String photoUrl;
    private String ownerId;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
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
    public String getOwnerId() { return ownerId; }
    public void setOwnerId(String ownerId) { this.ownerId = ownerId; }
}


