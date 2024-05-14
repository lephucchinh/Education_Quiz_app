import 'package:flutter/material.dart';

class AppLifecycleObserver with WidgetsBindingObserver {
  final Function(bool isOnline) onAppLifecycleChanged;

  AppLifecycleObserver({required this.onAppLifecycleChanged}) {
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    bool isOnline = state == AppLifecycleState.resumed;
    onAppLifecycleChanged(isOnline);
    // Gọi phương thức cập nhật trạng thái isOnline trên cơ sở dữ liệu của người dùng
  }

  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
  }
}