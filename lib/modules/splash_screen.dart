import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic_app/core/provider/app_provider.dart';
import 'package:provider/provider.dart';
import '../home.dart';


class splashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  void initState() {
    super.initState();

    // Safely navigate after a delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Home.routeName);
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        appProvider.isDark()
            ? "assets/images/splash_dark.png"
            : "assets/images/splash.png",
        width: mediaquery.width,
        height: mediaquery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
