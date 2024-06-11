import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pengasuh/auth_service.dart';
import 'package:pengasuh/children_info_provider.dart';
import 'package:pengasuh/child_activity_provider.dart';
import "package:pengasuh/screens/parent/child_info_screen.dart";

class CaregiverScreen extends StatefulWidget {
  const CaregiverScreen({super.key});

  @override
  State<CaregiverScreen> createState() => _CaregiverScreenState();
}

class _CaregiverScreenState extends State<CaregiverScreen> {
  final _formKey = GlobalKey<FormState>();
  final _activityController = TextEditingController();
  ChildInfo? _selectedChild;

  @override
  Widget build(BuildContext context) {
    final childrenInfo = context.watch<ChildrenInfoProvider>().childrenInfo;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.blue],
                ),
              ),
            ),
          ),
          // Scaffold with content on top for functionalities
          Scaffold(
            appBar: AppBar(
              title: const Text('Pengasuh'),
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
            backgroundColor: Color.fromARGB(
                0, 230, 17, 17), // Make Scaffold background transparent
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<ChildInfo>(
                      decoration: const InputDecoration(
                        labelText: 'Memilih Anak',
                      ),
                      items: childrenInfo.map((child) {
                        return DropdownMenuItem(
                          value: child,
                          child: Text(child.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedChild = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Memilih nama Anak';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _activityController,
                      decoration: const InputDecoration(
                        labelText: 'Aktvitas Anak',
                      ),
                      maxLines: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Kegiatan Anak';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final childActivity = ChildActivity(
                            _selectedChild!.name,
                            _activityController.text,
                          );
                          context
                              .read<ChildActivityProvider>()
                              .addChildActivity(childActivity);
                          _activityController.clear();
                        }
                      },
                      child: const Text('Simpan Kegiatan'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ... other class definitions (ChildInfo, ChildActivity, AuthService, ChildrenInfoProvider, ChildActivityProvider)
