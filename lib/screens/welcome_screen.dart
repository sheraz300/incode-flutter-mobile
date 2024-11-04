import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incode/screens/auth/auth_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xffDD1527),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffDD1527),
                  Color(0xff7D0C16),
                ]),
          ),
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: FadeInDown(child: Image.asset('assets/images/logo.png')),
              ),
              const Spacer(),
              const Text(
                'Version 2.0',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
