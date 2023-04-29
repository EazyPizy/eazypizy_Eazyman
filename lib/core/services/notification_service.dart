import 'dart:async';

import 'package:eazypizy_eazyman/core/logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NotificationService extends GetxService {
  static NotificationService instance = Get.find<NotificationService>();

  final Logger _log = getLogger('Notification Service');

  Future<NotificationService> init() async {
    // await setupInteractedMessage();
    _log.v('Notification Service intit...');
    return this;
  }

  Future<String?> getToken() async {
    // _log.i('fcm token - $fcmToken');
    return FirebaseMessaging.instance.getToken();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage event) {}
}
