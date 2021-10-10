import 'package:give_my_certificate/presentation/journeys/login/login_page.dart';
import 'package:give_my_certificate/presentation/journeys/signup/signup_page.dart';

class RouteList {
  RouteList._();

  static const String initial = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';

  static final routes = {
    login: (context) => LoginPage(),
    signup: (context) => SignupPage(),
  };
}
