import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'auth/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final List<String> cities = [
    'Bologna',
    'Rome',
    'Florence',
    'Milan',
    'Palermo',
    'Turin'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7D0C16),
        leading: const Icon(Icons.home, color: Colors.white),
        title: const Text('New York', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(198, 19, 35, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cities[index],
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const Icon(Icons.arrow_drop_down_circle,
                        color: Colors.white),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  GestureDetector logoutBtn(AppLocalizations localize) {
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
          child: Text(
            localize.logout_button,
            style: const TextStyle(
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
