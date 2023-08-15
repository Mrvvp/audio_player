// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class AudioPlayerWidget extends StatefulWidget {
//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   void playAudio() async {
//     int result = await audioPlayer.play('assets/audio.mp3', isLocal: true);
//     if (result == 1) {
//       // Success
//       print('Audio playing');
//     } else {
//       // Error
//       print('Error playing audio');
//     }
//   }
//
//   void pauseAudio() {
//     audioPlayer.pause();
//   }
//
//   void stopAudio() {
//     audioPlayer.stop();
//   }
//
//   @override
//   void dispose() {
//     audioPlayer.dispose(); // Dispose the audio player when the widget is disposed.
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: playAudio,
//           child: Text('Play'),
//         ),
//         ElevatedButton(
//           onPressed: pauseAudio,
//           child: Text('Pause'),
//         ),
//         ElevatedButton(
//           onPressed: stopAudio,
//           child: Text('Stop'),
//         ),
//       ],
//     );
//   }
// }
