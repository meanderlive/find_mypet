import 'dart:convert';

import 'package:equatable/equatable.dart';

class PetModel extends Equatable {
  final String id;
  final String name;
  final String species;
  final String breed;
  final String color;
  final String gender;
  final String lastSeenLocation;
  final String lastSeenDate;
  final String photoUrl;
  final String ownerId;
  const PetModel({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.color,
    required this.gender,
    required this.lastSeenLocation,
    required this.lastSeenDate,
    required this.photoUrl,
    required this.ownerId,
  });

  PetModel copyWith({
    String? id,
    String? name,
    String? species,
    String? breed,
    String? color,
    String? gender,
    String? lastSeenLocation,
    String? lastSeenDate,
    String? photoUrl,
    String? ownerId,
  }) {
    return PetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      color: color ?? this.color,
      gender: gender ?? this.gender,
      lastSeenLocation: lastSeenLocation ?? this.lastSeenLocation,
      lastSeenDate: lastSeenDate ?? this.lastSeenDate,
      photoUrl: photoUrl ?? this.photoUrl,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'color': color,
      'gender': gender,
      'lastSeenLocation': lastSeenLocation,
      'lastSeenDate': lastSeenDate,
      'photoUrl': photoUrl,
      'ownerId': ownerId,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      species: map['species'] as String,
      breed: map['breed'] as String,
      color: map['color'] as String,
      gender: map['gender'] as String,
      lastSeenLocation: map['lastSeenLocation'] as String,
      lastSeenDate: map['lastSeenDate'] as String,
      photoUrl: map['photoUrl'] as String,
      ownerId: map['ownerId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      species,
      breed,
      color,
      gender,
      lastSeenLocation,
      lastSeenDate,
      photoUrl,
      ownerId,
    ];
  }
}
