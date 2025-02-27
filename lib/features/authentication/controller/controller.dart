import 'package:flutter/material.dart';
import 'package:task/features/authentication/models/user_model.dart';
import 'package:task/features/authentication/repository/repository.dart';
import 'package:http/http.dart' as http;

class AuthController {
  final repo = AuthRepository();

  Future<UserModel?> fetchUserData({required String id}) {
    return repo.fetchUserData(id: id);
  }

  Future<http.Response> signUp(
      {required String email,
      required String password,
      required String name}) {
    return repo.signUp(
        email: email,
        password: password,
        name: name);
  }

  Future<http.Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return repo.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<http.Response> signWithGoogle() {
    return repo.signWithGoogle();
  }

  Future<http.Response> renewToken({required String refreshToken}) {
    return repo.renewToken(refreshToken: refreshToken);
  }
}
