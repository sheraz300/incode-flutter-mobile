import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7D0C16),
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
