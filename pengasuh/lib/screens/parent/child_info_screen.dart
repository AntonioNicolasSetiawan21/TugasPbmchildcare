import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pengasuh/children_info_provider.dart';

class ChildInfo {
  final String name;
  final String info;

  ChildInfo(this.name, this.info);
}

class ChildInfoScreen extends StatefulWidget {
  const ChildInfoScreen({super.key});

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _childNameController = TextEditingController();
  final _childInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppBar(
                title: const Text('Informasi Anak'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _childNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Anak',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Nama Anak';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _childInfoController,
                      decoration: const InputDecoration(
                        labelText: 'Informasi Anak',
                      ),
                      maxLines: null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukkan Informasi Anak';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final childName = _childNameController.text;
                          final childInfo = _childInfoController.text;
                          final childInfoData = ChildInfo(childName, childInfo);
                          context
                              .read<ChildrenInfoProvider>()
                              .addChildInfo(childInfoData);
                          _childNameController.clear();
                          _childInfoController.clear();
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
