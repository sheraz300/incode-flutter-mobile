import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF7D0C16),
        title: const Text('Work', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Work Screen'),
      ),
    );
  }
}
