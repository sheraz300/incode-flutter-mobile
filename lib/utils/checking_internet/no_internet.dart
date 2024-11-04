import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  static const String routeName = "/noInternet";
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: Stack(
            children: [
              Lottie.asset('assets/gifs/no net.json', width: 500, height: 500),
              const Positioned(
                bottom: 30,
                left: 150,
                child: Text(
                  'No Internet Connction',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
