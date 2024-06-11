import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pengasuh/child_activity_provider.dart';

class ChildActivityScreen extends StatelessWidget {
  const ChildActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final childActivities =
        context.watch<ChildActivityProvider>().childActivities;

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
        child: Scaffold(
          // Nested Scaffold for app bar
          appBar: AppBar(
            title: const Text('Aktivitas Anak'),
          ),
          body: ListView.builder(
            itemCount: childActivities.length,
            itemBuilder: (context, index) {
              final childActivity = childActivities[index];
              return ListTile(
                title: Text(childActivity.childName),
                subtitle: Text(childActivity.activity),
              );
            },
          ),
        ),
      ),
    );
  }
}
