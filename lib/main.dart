import 'package:breakbad/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RickMontery(appRoute: AppRoute(),));
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
