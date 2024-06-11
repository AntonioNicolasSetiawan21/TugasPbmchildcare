import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth_service.dart';
import 'package:pengasuh/screens/parent/parent_screen.dart';
import 'package:pengasuh/screens/caregiver/caregiver_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Wrap the entire content in a Container
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Use a linear gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Stack(
          // Maintain the Stack widget for layering elements
          children: [
            // Center the content within the Container
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Daycare icon (consider using a larger size and appropriate padding)
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Icon(
                      Icons.child_care,
                      size: 150,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 32.0),

                  // Login form and buttons (reuse from previous code)
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthService>().login(false);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CaregiverScreen(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.person_outline),
                              label: const Text('Login sebagai Pengasuh'),
                            ),
                            const SizedBox(width: 16.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthService>().login(true);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ParentScreen(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.family_restroom),
                              label: const Text('Login sebagai Orangtua'),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text('Register'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
