import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incode/utils/global_variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences prefs = await _prefs;
              prefs.clear();
              Get.offAll(AuthScreen());
            },
            child: const Text(
              'logout',
              style: TextStyle(color: Colors.black),
            ))
      ]),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome home'),
            TextButton(
                onPressed: () async {
                  final SharedPreferences prefs = await _prefs;
                  // print(prefs.get('token'));
                },
                child: registerationResponseModelGlobal != null
                    ? Text(
                        'Registered User ID : ${registerationResponseModelGlobal == null ? "" : registerationResponseModelGlobal!.id}')
                    : Text(
                        'User ID : ${loginResponseModelGlobal == null ? "" : loginResponseModelGlobal!.userId} \n'
                        "First Name : ${loginResponseModelGlobal!.firstName} \n"
                        "Last Name : ${loginResponseModelGlobal!.lastName}")),
          ],
        ),
      ),
    );
  }
}
