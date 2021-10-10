import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:give_my_certificate/common/screenutil/screenutil.dart';
import 'package:give_my_certificate/presentation/giveMyCertificateApp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GiveMyCertificateApp());
}
