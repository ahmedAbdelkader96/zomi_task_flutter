import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/features/authentication/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?> fetchUserData({required String id});

  Future<http.Response> signUp(
      {required String email, required String password, required String name});

  Future<http.Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<http.Response> signWithGoogle();

  Future<http.Response> renewToken({required String refreshToken});
}
