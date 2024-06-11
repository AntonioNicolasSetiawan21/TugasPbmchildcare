import 'package:flutter/material.dart';
import 'package:pengasuh/screens/parent/child_info_screen.dart';

class ChildrenInfoProvider extends ChangeNotifier {
  final List<ChildInfo> _childrenInfo = [];

  List<ChildInfo> get childrenInfo => _childrenInfo;

  void addChildInfo(ChildInfo childInfo) {
    _childrenInfo.add(childInfo);
    notifyListeners();
  }
}