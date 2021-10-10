import 'package:flutter/material.dart';
import 'package:give_my_certificate/common/constants/route_constants.dart';
import 'package:give_my_certificate/presentation/journeys/login/login_page.dart';
import 'package:give_my_certificate/presentation/providers/app_providers.dart';
import 'package:provider/provider.dart';

import 'theme/theme_colors.dart';
import 'theme/theme_text.dart';

class GiveMyCertificateApp extends StatefulWidget {
  const GiveMyCertificateApp({Key? key}) : super(key: key);

  @override
  _GiveMyCertificateAppState createState() => _GiveMyCertificateAppState();
}

class _GiveMyCertificateAppState extends State<GiveMyCertificateApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Give My Certificate',
        theme: new ThemeData(
          brightness: Brightness.dark,
          canvasColor: AppColor.darkGunmetal,
          textTheme: ThemeText.getTextTheme(),
        ),
        initialRoute: RouteList.login,
        routes: RouteList.routes,
      ),
    );
  }
}
