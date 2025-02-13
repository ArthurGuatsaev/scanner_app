import 'dart:async';

import 'package:flutter/material.dart';

class SettingRepository {
  SettingRepository() {
    WidgetsBinding.instance.addObserver(MyObserver(setting: this));
  }
  StreamController<String> lifecycleStateController = StreamController();
  bool music = true;
  bool sound = true;
}

class MyObserver extends WidgetsBindingObserver {
  final SettingRepository setting;

  MyObserver({required this.setting});
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused && setting.music) {
      setting.lifecycleStateController.add('pause');
    }
    if (state == AppLifecycleState.resumed && setting.music) {
      setting.lifecycleStateController.add('resume');
    }
    super.didChangeAppLifecycleState(state);
  }
}
