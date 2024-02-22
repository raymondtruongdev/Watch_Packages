import 'package:chat_bot/controller/controller.dart';
import 'package:chat_bot/logger_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);

final CustomLogger logger = CustomLogger();

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // Save data when the app is closed or paused
    if (state == AppLifecycleState.inactive) {
      await saveDataState();
    }
  }

  Future<void> saveDataState() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setInt('_cityIndex', 10);
    // logger.info('Save state data success');
  }
}
