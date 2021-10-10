import 'package:flutter/material.dart';
import 'package:give_my_certificate/common/constants/size_constants.dart';
import 'package:give_my_certificate/common/constants/string_constants.dart';
import 'package:give_my_certificate/common/validation.dart';
import 'package:give_my_certificate/data/notifiers/authantication_notifier.dart';
import '../../../common/extensions/validator_extensions.dart';
import 'package:give_my_certificate/presentation/theme/theme_text.dart';
import 'package:give_my_certificate/presentation/widgets/text_field.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:provider/provider.dart';
import '/common/extensions/size_extensions.dart';
import 'login_page_widgets/button.dart';
import 'login_page_widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController? _emailController, _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthanticationNotifier authanticationNotifier =
        Provider.of<AuthanticationNotifier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_24.w, vertical: Sizes.dimen_10.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //button for light and dark mode
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.light_mode)),
                  //give my certificate logo
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 22,
                          width: 22,
                          child: Image.asset("assets/pngs/gmclogo.png")),
                      Text("Give My Certificate"),
                    ],
                  )),
                  SizedBox(height: Sizes.dimen_32.h),

                  //welcome back string
                  Text(
                    StringConstants.welcomeBack,
                    style: ThemeText.getTextTheme().headline6,
                  ),
                  SizedBox(height: Sizes.dimen_14.h),

                  //Sign in to continue string
                  Text(
                    StringConstants.signInToContinue,
                    style: ThemeText.getTextTheme().headline5,
                  ),
                  SizedBox(height: Sizes.dimen_40.h),

                  //social button 1
                  SocialLoginButton(
                    onPressed: () {
                      authanticationNotifier.loginWithGoogle(context: context);
                    },
                    imgPath: "assets/google.png",
                    socialName: StringConstants.signUpWithGoogle,
                  ),
                  SizedBox(height: Sizes.dimen_10.h),
                  //social button 2
                  SocialLoginButton(
                    imgPath: "assets/fb2.png",
                    socialName: StringConstants.signUpWithFacebook,
                    onPressed: () {
                      authanticationNotifier.loginWithFacebook(
                          context: context);
                    },
                  ),
                  SizedBox(height: Sizes.dimen_20.h),

                  //or divider
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(
                        width: Sizes.dimen_16.w,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          fontSize: Sizes.dimen_14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dimen_16.w,
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: Sizes.dimen_20.h),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Email*"),
                  ),

                  //email textField
                  EmailInputField(
                    hintText: "someone@email",
                    validateFunction: (input) =>
                        input!.isValidEmail() ? null : "Check your email",
                    textEditingController: _emailController,
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Password*"),
                  ),

                  //password textField
                  EmailInputField(
                    hintText: "***********",
                    validateFunction: (input) =>
                        input!.isValidPassword() ? null : "Check your email",
                    textEditingController: _passwordController,
                    icon: Icons.lock,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        Text(StringConstants.forgotPassword),
                        Spacer(),
                        Text(StringConstants.getMagicLink),
                      ],
                    ),
                  ),

                  //validtion +login Proccessss
                  Button(
                    onPressed: () {
                      if (_passwordController!.text.isValidPassword() &&
                          _emailController!.text.isValidEmail()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Process pass:")));
                        authanticationNotifier.login(
                            email: _emailController!.text,
                            password: _passwordController!.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("email/password not valid")));
                      }
                    },
                    text: StringConstants.signIn,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(StringConstants.newUser)),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
