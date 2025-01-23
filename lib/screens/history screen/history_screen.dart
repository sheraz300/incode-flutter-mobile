import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7D0C16),
        title: const Text('Interventi', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Nulla da visualizzare'),
      ),
    );
  }
}
