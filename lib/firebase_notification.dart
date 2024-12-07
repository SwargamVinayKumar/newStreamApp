import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_video/stream_video.dart';
import 'package:stream_video_push_notification/stream_video_push_notification.dart';
import 'package:rxdart/rxdart.dart';
import 'callScreen.dart';
import 'extentions/utils.dart';

final _compositeSubscription = CompositeSubscription();

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {


  try {
    StreamVideo.reset();
    var credentials = User.regular(userId:userStreamId, name:userStreamName);
    var streamVideo = StreamVideo(
      appStreamKey,
      user: credentials,
      userToken: userStreamToken,
          options: const StreamVideoOptions(
        // It's important to keep connections alive when the app is in the background to properly handle incoming calls while the app is in the background
        keepConnectionsAliveWhenInBackground: true,
      ),
      pushNotificationManagerProvider: StreamVideoPushNotificationManager.create(
        iosPushProvider: const StreamVideoPushProvider.apn(
          name: 'apn',
        ),
        androidPushProvider: const StreamVideoPushProvider.firebase(
          name: 'FireBaseCallNotification',
        ),
        pushParams: const StreamVideoPushParams(
          appName: "StreamCall",
          ios: IOSParams(iconName: 'IconMask'),
            missedCallNotification: NotificationParams(
              showNotification: true,
              subtitle: 'Missed Call',
              callbackText: 'Call Back',
            )
        ),
      ),
    );
    

    await streamVideo.connect();

    streamVideo.observeCallDeclinedCallKitEvent();
    handleRemoteMessage(message);

  } catch (e, stk) {
    debugPrint('Error handling remote message: $e');
    debugPrint(stk.toString());
  }

}

// Future<void> handleRemoteMessage(RemoteMessage message) async {
//   final payload = message.data;
//
//   final sender = payload['sender'] as String?;
//   final type = payload['type'] as String?;
//
//   if (sender == 'stream.video' && type == 'call.notification') {
//     final callCid = payload['call_cid'] as String?;
//     // Show notification, for example using `flutter_local_notifications` package
//   }
//
//   final streamVideo = locator.get<StreamVideo>();
//   return streamVideo.handleVoipPushNotification(
//     message.data,
//   );
// }

void handleRemoteMessage(RemoteMessage message) {
   StreamVideo.instance.handleVoipPushNotification(message.data);
  _observeCallKitEvents();
}


void _observeCallKitEvents() {
  final streamVideo = StreamVideo.instance;
  _compositeSubscription.add(
    streamVideo.observeCoreCallKitEvents(
      onCallAccepted: (callToJoin) {
        Get.to(() => CallScreen(call: callToJoin));
      },
    ),
  );
}





//
// class FireBaseNotification {
//
//   // final _firebaseMessaging = FirebaseMessaging.instance;
//   //
//   // final _androidChannel = const AndroidNotificationChannel(
//   //   'channel_id',
//   //   'Channel Name',
//   //   importance: Importance.high,
//   // );
//   // final _locationNotification = FlutterLocalNotificationsPlugin();
//   // void handleMessage(RemoteMessage? message) {
//   //   if (message == null) return;
//   // }
//   //
//   // Future<void> initLocalNotification() async {
//   //   final List<DarwinNotificationCategory> darwinNotificationCategories =
//   //   <DarwinNotificationCategory>[
//   //     DarwinNotificationCategory(
//   //       'darwinNotificationCategoryText',
//   //       actions: <DarwinNotificationAction>[
//   //         DarwinNotificationAction.text(
//   //           'text_1',
//   //           'Action 1',
//   //           buttonTitle: 'Send',
//   //           placeholder: 'Placeholder',
//   //         ),
//   //       ],
//   //     )
//   //   ];
//   //   const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//   //   const settings = InitializationSettings(
//   //       android: android, iOS: DarwinInitializationSettings());
//   //   await _locationNotification.initialize(
//   //     settings,
//   //   );
//   //   await _locationNotification
//   //       .resolvePlatformSpecificImplementation<
//   //       AndroidFlutterLocalNotificationsPlugin>()
//   //       ?.createNotificationChannel(_androidChannel);
//   // }
//   //
//   // Future<void> initPushNotification() async {
//   //   await FirebaseMessaging.instance
//   //       .setForegroundNotificationPresentationOptions(
//   //     alert: true,
//   //     badge: true,
//   //     sound: true,
//   //   );
//   //
//   //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//   //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   //   FirebaseMessaging.onMessage.listen((message) {
//   //     final notification = message.notification;
//   //     if (notification == null) return;
//   //
//   //     _locationNotification.show(
//   //       notification.hashCode,
//   //       notification.title ?? '',
//   //       notification.body ?? '',
//   //       NotificationDetails(
//   //         android: AndroidNotificationDetails(
//   //           _androidChannel.id,
//   //           _androidChannel.name,
//   //           icon: '@mipmap/ic_launcher',
//   //         ),
//   //       ),
//   //       payload: jsonEncode(message.data),
//   //     );
//   //   });
//   // }
//   //
//   // Future<void> initNotifications() async {
//   //   await _firebaseMessaging.requestPermission();
//   //   initPushNotification();
//   //   initLocalNotification();
//   // }
//
//   // As this runs in a separate isolate, we need to setup the app again.
//
//
// }
