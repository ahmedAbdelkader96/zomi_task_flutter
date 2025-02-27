import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:task/features/authentication/models/user_model.dart';
import 'package:task/features/authentication/repository/irepository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<UserModel?> fetchUserData({required String id}) async {
    try {
      var url = Uri.parse('${dotenv.env['end_point']}/user?id=$id');
      var res = await http.get(url).timeout(const Duration(seconds: 60));
      var data = jsonDecode(res.body);
      UserModel userModel = UserModel.fromJson(data);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var body = {
        "name": name,
        "email": email,
        "password": password,
        "authenticationType": 'email',
      };

      var url = Uri.parse('${dotenv.env['end_point']}/user/signup');
      var res =
          await http.post(url, body: body).timeout(const Duration(seconds: 60));

      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var body = {
        "email": email,
        "password": password,
      };
      var url = Uri.parse('${dotenv.env['end_point']}/user/login');
      var res =
          await http.post(url, body: body).timeout(const Duration(seconds: 60));
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> signWithGoogle() async {
    try {
      String webClientId = dotenv.env['webClientId'].toString();

      String clientId = dotenv.env['clientId'].toString();

      final GoogleSignIn googleSignIn =
          GoogleSignIn(clientId: clientId, serverClientId: webClientId);
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        var body = {
          "name": googleUser.displayName.toString(),
          "email": googleUser.email,
          "googleId": googleUser.id
        };

        var url = Uri.parse('${dotenv.env['end_point']}/user/sign_google');
        var res = await http
            .post(url, body: body)
            .timeout(const Duration(seconds: 60));
        googleSignIn.signOut();
        return res;
      } else {
        throw 'Error Occurred!';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<http.Response> renewToken({required String refreshToken}) async {
    try {
      var body = {
        "refreshToken": refreshToken,
      };
      var url = Uri.parse('${dotenv.env['end_point']}/user/renew_token');
      var res =
          await http.post(url, body: body).timeout(const Duration(seconds: 60));
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
