import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pengasuh/auth_service.dart';
import 'package:pengasuh/children_info_provider.dart';
import 'package:pengasuh/child_activity_provider.dart';
import 'package:pengasuh/screens/login_screen.dart';
import 'package:pengasuh/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ChildrenInfoProvider()),
        ChangeNotifierProvider(create: (_) => ChildActivityProvider()),
      ],
      child: MaterialApp(
        title: 'Pengasuh',
        routes: {
          '/': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
        },
      ),
    );
  }
}