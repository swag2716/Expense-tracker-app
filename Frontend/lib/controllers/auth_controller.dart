import 'dart:convert';

import 'package:get/get.dart';
import '../models/auth_model.dart';
import 'package:http/http.dart' as http;

import '../storage/auth_storage.dart';

class AuthController extends GetxController{
  RxList<AuthModel> users = <AuthModel>[].obs;

  Future<void> signUp(AuthModel user) async{
    try{
      String url = 'http://192.168.29.116:9000/users/signup';

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(user.toJSON()),
        headers: {'Content-Type':'application/json'},
      );

      final jsonData = jsonDecode(response.body);
      if(response.statusCode == 200) {
        final createdUser = AuthModel.fromJSON(jsonData);

        final tokenManager = TokenManager();
        final accessToken = createdUser.token;
        final refreshToken = createdUser.refreshToken;

        final name = createdUser.name;
        final email = createdUser.email;
        final phoneNumber = createdUser.phoneNumber;

        await tokenManager.saveTokens(accessToken, refreshToken);
        await tokenManager.saveUserDetails(name, email, phoneNumber);

        users.add(createdUser);
      } else{
        Get.snackbar("error", jsonData['error']);
        throw Exception('Failed to create user');
      }
    } catch(e){
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> logIn(AuthModel user) async{
    try{
      String url = 'http://192.168.29.116:9000/users/login';

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(user.toJSON()),
        headers: {'Content-Type':'application/json'},
      );

      final jsonData = jsonDecode(response.body);
      if(response.statusCode == 200) {
        final currentUser = AuthModel.fromJSON(jsonData);

        final tokenManager = TokenManager();
        final accessToken = currentUser.token;
        final refreshToken = currentUser.refreshToken;

        final name = currentUser.name;
        final email = currentUser.email;
        final phoneNumber = currentUser.phoneNumber;

        await tokenManager.saveTokens(accessToken, refreshToken);
        await tokenManager.saveUserDetails(name, email, phoneNumber);

        // final index = users.indexWhere((u) => u.id == user.id);
        // if (index != -1) {
        //   users[index] = user;
        // }
      } else{
        Get.snackbar("error", jsonData['error']);
        throw Exception('Failed to login user');
      }
    } catch(e){
      throw Exception('Failed to login user: $e');
    }
  }
}