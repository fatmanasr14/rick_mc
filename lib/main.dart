import 'dart:io';
import 'package:breakbad/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  // قم بتعيين HttpOverrides
  HttpOverrides.global = MyHttpOverrides();
  
  runApp(RickMontery(appRoute: AppRoute()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class RickMontery extends StatelessWidget {
  final AppRoute appRoute;

  const RickMontery({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
