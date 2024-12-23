import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

import 'extentions/statefullwrapper.dart';

class CallScreen extends StatefulWidget {
  final Call? call;

  const CallScreen({
    super.key,
    required this.call,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        widget.call?.join();
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: StreamCallContainer(
          call: widget.call!,
          callContentBuilder: (
              BuildContext context,
              Call call,
              CallState callState,
              ) {
            return StreamCallContent(
              call: call,
              callState: callState,
              callControlsBuilder: (
                  BuildContext context,
                  Call call,
                  CallState callState,
                  ) {
                final localParticipant = callState.localParticipant!;
                return StreamCallControls(
                  options: [
                    ToggleSpeakerphoneOption(
                      call: call,
                    ),
                    FlipCameraOption(
                      call: call,
                      localParticipant: localParticipant,
                    ),
                    LeaveCallOption(
                      call: call,
                      onLeaveCallTap: () {
                        call.leave();
                      },
                    ),
                    ToggleMicrophoneOption(
                      call: call,
                      localParticipant: localParticipant,
                    ),
                    ToggleCameraOption(
                      call: call,
                      localParticipant: localParticipant,
                    ),
                    AddReactionOption(
                      call: call,
                      localParticipant: localParticipant,
                    ),
                  ],
                );
              },
            );
          },
        ),),
      ),
    );
  }
}