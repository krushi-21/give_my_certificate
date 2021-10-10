import 'package:flutter/material.dart';
import 'package:give_my_certificate/data/core/api_constants.dart';
import 'package:give_my_certificate/data/core/db_client.dart';
import 'package:supabase/supabase.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthanticationService {
  Future<String?> signup(
      {required String email, required String password}) async {
    GotrueSessionResponse response =
        await DbClient.supabaseClient.auth.signUp(email, password);

    if (response.error == null) {
      String? useremail = response.data!.user!.email;
      print("Sign up Successful : $useremail");
    } else {
      print("Sign up Error : ${response.error!.message}");
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    GotrueSessionResponse response = await DbClient.supabaseClient.auth.signIn(
        email: email,
        password: password,
        options: AuthOptions(redirectTo: ApiConstants.BASE_URL));

    if (response.error == null) {
      String? useremail = response.data!.user!.email;
      print("Log In Successful : $useremail");
    } else {
      print("Log In  Error : ${response.error!.message}");
    }
  }

  Future loginWithFacebook({required BuildContext context}) async {
    try {
      GotrueSessionResponse response = await DbClient.supabaseClient.auth
          .signIn(provider: Provider.facebook);

      if (response.error == null) {
        String authUrl = response.url!;
        print("Facebook auth initiated");
        launch(authUrl);
      } else {
        print(response.error!.message);
        // SnackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Process failed: ${response.error!.message}")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future loginWithGoogle({required BuildContext context}) async {
    try {
      GotrueSessionResponse response =
          await DbClient.supabaseClient.auth.signIn(provider: Provider.google);

      if (response.error == null) {
        String authUrl = response.url!;
        print("Google auth initiated");
        launch(authUrl);
      } else {
        print(response.error!.message);
        // SnackBar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Process failed: ${response.error!.message}")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
