import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';


class CustomIncomingCallScreen extends StatefulWidget {
  final Call? call;

  const CustomIncomingCallScreen({super.key, required this.call});

  @override
  State<CustomIncomingCallScreen> createState() => _CustomIncomingCallScreenState();
}

class _CustomIncomingCallScreenState extends State<CustomIncomingCallScreen> with SingleTickerProviderStateMixin {
  double _dragPosition = 0.0;
  final double _maxDrag = 150.0;

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
  // }

  // void _playAudio() async {
  //   if (!_isPlaying) {
  //     await _audioPlayer.play(
  //       UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
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
                "Incoming call...",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16),
            ],
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background track
                Container(
                  width: _maxDrag * 2 + 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                // Accept and Decline labels
                Positioned(
                  left: 20,
                  child: Row(
                    children: [
                      Icon(Icons.call_end, color: Colors.red),
                      const SizedBox(width: 8),
                      const Text(
                        "Decline",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Row(
                    children: [
                      const Text(
                        "Accept",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.call, color: Colors.green),
                    ],
                  ),
                ),

                // Draggable thumb
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 30 + _dragPosition,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _dragPosition += details.delta.dx;
                        if (_dragPosition < -_maxDrag) {
                          _dragPosition = -_maxDrag; // Limit to left
                          _onCallDeclined();
                        }
                        if (_dragPosition > _maxDrag) {
                          _dragPosition = _maxDrag; // Limit to right
                          _onCallAccepted();
                        }
                      });
                    },
                    onHorizontalDragEnd: (_) {
                      if (_dragPosition.abs() < _maxDrag) {
                        setState(() {
                          _dragPosition = 0.0; // Reset to center
                        });
                      }
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.phone_android,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onCallAccepted() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Call Accepted")),
    );
    setState(() {
      _dragPosition = 0.0;
    });
    widget.call?.accept();
    // _stopAudio();
  }

  void _onCallDeclined() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Call Declined")),
    );
    setState(() {
      _dragPosition = 0.0;
    });
    // _stopAudio();
    widget.call?.reject();
  }

}