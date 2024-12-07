import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newstream/extentions/utils.dart';
import 'package:newstream/pages/custom_outgoing_call_page.dart';
import 'package:newstream/pages/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_video/stream_video.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:stream_video_push_notification/stream_video_push_notification.dart';
import 'callScreen.dart';
import 'firebase_options.dart';
import 'firebase_notification.dart';
import 'globals.dart';


late StreamSubscription<RemoteMessage> _fcmSubscription;
late StreamVideo streamVideo;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  userStreamId = prefs.getString("userStreamId") ?? "Avatar";
  userStreamName = prefs.getString("userStreamName") ?? "Avatar";
  userStreamToken = prefs.getString("userStreamToken") ?? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiQXZhdGFyIn0.TMfE0yzGR-cgWcDBitel34otZp2CaTTiB1Ft6aF4HUM";


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   print("hello");
   print(userStreamId.toString());
   print(userStreamToken.toString());
  var credentials = User.regular(userId:userStreamId, name:userStreamName);
  streamVideo = StreamVideo(
    appStreamKey,
    user: credentials,
    userToken:userStreamToken,
    options: const StreamVideoOptions(
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

  StreamBackgroundService.init(
    StreamVideo.instance,
  );

  await requestNotificationPermission();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _observeFcmMessages(context);
    _tryConsumingIncomingCallFromTerminatedState(context);
    StreamVideo.instance.observeCallAcceptCallKitEvent( onCallAccepted: (callToJoin) {
      Get.to(() => CallScreen(call: callToJoin));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      popGesture: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const SplashScreen(),
    );
  }
}

void _observeFcmMessages(BuildContext context) {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // _fcmSubscription = FirebaseMessaging.onMessage.listen(handleRemoteMessage);
}

void _tryConsumingIncomingCallFromTerminatedState(BuildContext context) {
  if (CurrentPlatform.isIos) return;
  if (navigatorKey.currentContext == null) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _consumeIncomingCall(context);
    });
  } else {

  }
}

Future<void> _consumeIncomingCall(BuildContext context) async {
  final calls = await StreamVideo.instance.pushNotificationManager?.activeCalls();
  if (calls == null || calls.isEmpty) return;
  final callResult = await StreamVideo.instance.consumeIncomingCall(
    uuid: calls.first.uuid!,
    cid: calls.first.callCid!,
  );
  callResult.fold(success: (result) async {
    final call = result.data;
    await call.accept();
    Get.to(() => CallScreen(call: call));
  }, failure: (error) {
    debugPrint('Error consuming incoming call: $error');
  });
}

Future<void> requestNotificationPermission() async {
  PermissionStatus status = await Permission.notification.status;
  if (status.isGranted) {
    print("Notification permission already granted.");
  } else if (status.isDenied) {
    PermissionStatus result = await Permission.notification.request();
    if (result.isGranted) {
      print("Notification permission granted.");
    } else {
      print("Notification permission denied.");
    }
  } else if (status.isPermanentlyDenied) {
    print("Notification permission permanently denied. Please enable it from settings.");
    openAppSettings();
  }
}







