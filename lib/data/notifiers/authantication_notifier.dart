import 'package:flutter/cupertino.dart';
import 'package:give_my_certificate/data/services/auth_service.dart';

class AuthanticationNotifier extends ChangeNotifier {
  AuthanticationService _authanticationService = new AuthanticationService();

  Future<String?> signup(
      {required String email, required String password}) async {
    try {
      await _authanticationService.signup(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await _authanticationService.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future loginWithFacebook({
    required BuildContext context,
  }) async {
    try {
      await _authanticationService.loginWithFacebook(context: context);
    } catch (e) {
      print(e);
    }
  }

  Future loginWithGoogle({
    required BuildContext context,
  }) async {
    try {
      await _authanticationService.loginWithGoogle(context: context);
    } catch (e) {
      print(e);
    }
  }
}
