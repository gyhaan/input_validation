import 'package:flutter/material.dart';
import 'package:input_validation/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validation App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignupScreen(),
    );
  }
}
