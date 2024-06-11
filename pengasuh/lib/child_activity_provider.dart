import 'package:flutter/material.dart';

class ChildActivity {
  final String childName;
  final String activity;

  ChildActivity(this.childName, this.activity);
}

class ChildActivityProvider extends ChangeNotifier {
  final List<ChildActivity> _childActivities = [];

  List<ChildActivity> get childActivities => _childActivities;

  void addChildActivity(ChildActivity childActivity) {
    _childActivities.add(childActivity);
    notifyListeners();
  }
}