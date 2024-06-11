import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../auth_service.dart';
import 'package:pengasuh/screens/parent/child_info_screen.dart';
import 'package:pengasuh/screens/parent/child_activity_screen.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orangtua'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().logout();
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        // Wrap the content in a Container
        decoration: BoxDecoration(
          // Add decoration for the background
          gradient: LinearGradient(
            // Use a linear gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChildInfoScreen(),
                    ),
                  );
                },
                child: const Text('Masukkan Informasi Anak'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChildActivityScreen(),
                    ),
                  );
                },
                child: const Text('Melihat Aktivitas Anak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
