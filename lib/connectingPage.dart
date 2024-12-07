

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stream_video/stream_video.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';



import 'callScreen.dart';

final _compositeSubscription = CompositeSubscription();

class ConnectingPage extends StatefulWidget {
  final String userId;
  const ConnectingPage({super.key,required this.userId});

  @override
  State<ConnectingPage> createState() => _ConnectingPageState();
}

class _ConnectingPageState extends State<ConnectingPage> {
  // final _compositeSubscription = CompositeSubscription();
  var streamInstance = StreamVideo.instance;
  var callId = "";
  var otherUserId = "";
  late bool progressBar = false;


  @override
  void initState() {
    super.initState();
    _observeCallKitEvents(context);
    StreamVideo.instance.state.incomingCall.listen(_onNavigateToCall);
  }

  // void _observeCallKitEvents() {
  //   final streamVideo = StreamVideo.instance;
  //
  //   streamVideo.observeCoreCallKitEvents(
  //     onCallAccepted: (callToJoin) {
  //       // Navigate to call screen
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CallScreen(call: callToJoin),
  //         ),
  //       );
  //     },
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        top:true
        ,child:Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Connected as ${widget.userId}")
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    callId = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Enter CallId",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    otherUserId = text;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Enter User Id To Connect With",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
            child: const Text('Create Call'),
            onPressed: () async {
              try {
                // if(callId.trim().isEmpty) {
                //   Get.snackbar("Error", "Enter CallId To Connect");
                //   return;
                // }
                if(otherUserId.trim().isEmpty) {
                  Get.snackbar("Error", "Enter UserId To Connect With");
                  return;
                }
                setState(() {
                  progressBar = true;
                });
                final callId = Uuid().v4().trim().toString();
                final call = StreamVideo.instance.makeCall(callType: StreamCallType.defaultType(), id: callId);
                print("callId");
                print(callId);

                await call.getOrCreate(memberIds: [widget.userId,otherUserId],
                    ringing: true,
                    video: true,
                    limits: const StreamLimitsSettings(
                      maxDurationSeconds: 60,
                    )
                );
                // await call.join();c
                setState(() {
                  progressBar = false;
                });
                Get.to(() => CallScreen(call: call));
                // Created ahead
              } catch (e) {
                debugPrint('Error joining or creating call: $e');
                debugPrint(e.toString());
              }
            },
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: progressBar,
                  child: SizedBox(width: 50,height: 50,
                    child:
                    CircularProgressIndicator(),),
                )
              ],
            )
          ]
        )
      )
    );
  }

  void _onNavigateToCall(Call? value) {
    Get.to(() =>CallScreen(call: value));
  }
}

void _observeCallKitEvents(BuildContext context) {
  final streamVideo = StreamVideo.instance;
  _compositeSubscription.add(
    streamVideo.observeCoreCallKitEvents(
      onCallAccepted: (callToJoin) {
        Get.to(() => CallScreen(call: callToJoin));
      },
    ),
  );
  // Or you can handle them by yourself, and/or add additional events such as handling mute events from CallKit
  // _compositeSubscription.add(streamVideo.onCallKitEvent<ActionCallToggleMute>(_onCallToggleMute));
}











