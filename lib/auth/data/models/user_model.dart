// lib/auth/data/models/user_model.dart

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String token;
  final String email;

  const UserModel({
    required this.username,
    required this.token,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      token: json['token'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'token': token,
      'email': email,
    };
  }

  @override
  List<Object> get props => [username, token, email];
}
