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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDD1527),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFFDD1527),
              Color(0xFF7D0C16),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Welcome Home',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () async {
                    final SharedPreferences prefs = await _prefs;
                    // print(prefs.get('token'));
                  },
                  child: registerationResponseModelGlobal != null
                      ? Text(
                          'Registered User ID : ${registerationResponseModelGlobal == null ? "" : registerationResponseModelGlobal!.id}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'User ID : ${loginResponseModelGlobal == null ? "" : loginResponseModelGlobal!.userId} \n'
                          "First Name : ${loginResponseModelGlobal!.firstName} \n"
                          "Last Name : ${loginResponseModelGlobal!.lastName}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )),
              // const Spacer(),
              const SizedBox(
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: logoutBtn(),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector logoutBtn() {
    return GestureDetector(
      onTap: () async {
        final SharedPreferences prefs = await _prefs;
        prefs.clear();
        Get.offAll(AuthScreen());
      },
      child: Center(
        child: Container(
          width: 170,
          height: 53,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 9.90,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
