import 'package:flutter/material.dart';
import 'package:jailbreak_demo/widgets/app_security_gate.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: AppSecurityGate(child: LoginScreen()),
    );
  }
}
