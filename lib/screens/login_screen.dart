import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// Validates if the email field is not empty and has a valid email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email'; // Error message if email is empty
    } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+').hasMatch(value)) {
      return 'Please enter a valid email'; // Error if email format is incorrect
    }
    return null; // Valid input
  }

// Validates if the password is not empty and is at least 6 characters long
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password'; // Error message if password is empty
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters'; // Error if password is too short
    }
    return null; // Valid input
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: validateEmail,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: const Text('Don’t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
