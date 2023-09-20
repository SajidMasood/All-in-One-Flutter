import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/screens/testads/test_ads.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../constants/text_string.dart';

class OneSignalService {
  //
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static OneSignal? _instance;

  OneSignalSService(BuildContext context) {
    log("----OneSignalSService----");
    getInstance();
    _instance!.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _instance!.setAppId(oneSignalAppId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    _instance!.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    _instance!.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    _instance!
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      log("--------NotificationOpenedHandler---------");
      var data = result.notification.additionalData;
      print(data);
      try {
        // navigatorKey.currentState!.push(MaterialPageRoute(
        //   builder: (context) => TestAds(postId: data["post_id"].toString()),
        // ));
        Future.delayed(Duration(seconds: 3)).then((value) {
          navigatorKey.currentState!.pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  TestAds(postId: data!["post_id"].toString()),
            ),
          );
        });
      } catch (e) {
        log(e.toString());
      }
    });

    _instance!.setPermissionObserver((OSPermissionStateChanges changes) {
      // Will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });
  }

  static OneSignal? getInstance() {
    _instance ??= OneSignal.shared;
    return _instance;
  }

  Future<void> getUserTokenId() async {
    var deviceState = await _instance!.getDeviceState();
    if (deviceState != null || deviceState?.userId != null) {
      String tokenId = deviceState!.userId!;
      print("TOKEN ID: " + tokenId);
    }
  }

  void handleSendNotification({
    required String tokenId,
    required String title,
    required String desc,
  }) async {
    var notification = OSCreateNotification(
        playerIds: [tokenId], content: desc, heading: title);
    await _instance!.postNotification(notification);
  }
}
