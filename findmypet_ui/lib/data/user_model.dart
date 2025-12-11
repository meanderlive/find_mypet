// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  const UserModel({required this.email});

  UserModel copyWith({String? email}) {
    return UserModel(email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(email: map['email'] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email];
}
