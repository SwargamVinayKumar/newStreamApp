import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class CustomOutgoingCallPage extends StatefulWidget {
  final Call? call;
  const CustomOutgoingCallPage({super.key, required this.call});

  @override
  State<CustomOutgoingCallPage> createState() => _CustomOutgoingCallPageState();
}

class _CustomOutgoingCallPageState extends State<CustomOutgoingCallPage> {

  // late AudioPlayer _audioPlayer;
  // bool _isPlaying = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _audioPlayer = AudioPlayer();
  //   _playAudio();
  // }

  // @override
  // void dispose() {
  //   _stopAudio();
  //   _audioPlayer.dispose();
  //   super.dispose();
  //
  // }

  // void _playAudio() async {
  //   if (!_isPlaying) {
  //     await _audioPlayer.play(
  //       UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3'),
  //     );
  //     setState(() => _isPlaying = true);
  //   } else {
  //     await _audioPlayer.pause();
  //     setState(() => _isPlaying = false);
  //   }
  // }
  //
  // void _stopAudio() async {
  //   await _audioPlayer.stop();
  //   setState(() => _isPlaying = false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/person.png'), // Replace with your asset
                ),
                SizedBox(height: 16),
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Calling...",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 16),
              ],
            ),
            GestureDetector(
              onTap: (){
                widget.call?.reject();
                // _stopAudio();// Reject the call
              },
              child: Container(width: 50,height: 50,decoration:
                const BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(100))),child:Center(child: Icon(Icons.call_end,color: Colors.white)) ),
            )
          ],
        ),
      ),
    );
  }
}
