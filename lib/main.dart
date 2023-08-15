import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicApp(),
    );
  }
}

class MusicApp extends StatefulWidget {
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {

  bool playing = false;
  bool isPaused = false;
  bool isLoop = false;
  IconData playBtn = Icons.play_arrow;
  late AudioPlayer _player;
  late AudioCache cache;
  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider(){
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      value: position.inSeconds.toDouble(),
      min:0.0,      max:musicLength.inSeconds.toDouble(),
    onChanged: (double value){
        setState(() {
          seekToSec(value.toInt());
          value = value;
        });
    },
    );
  }


  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache();

    _player.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });
    _player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade200,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60,),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text("Music Beats",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text("Listen to your favourite Music",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 400,
                    height: 280,
                    decoration:
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/img.png"),

                      ),
                    ),

                  ),
                ),

                const Center(
                  child: Text(
                    "Beats",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    decoration:
                    BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text("${position.inMinutes}:${position.inSeconds
                                  .remainder(60)}"),

                             slider(),

                              Text("${musicLength.inMinutes}:${musicLength
                                  .inSeconds.remainder(60)}"),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 45,
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous,),),
                            IconButton(
                              iconSize: 65,
                              color: Colors.black,
                              onPressed: () {
                                if (!playing) {
                                  setState(() {
                                    playBtn = Icons.pause;
                                    playing = true;
                                  });
                                } else {
                                  _player.pause();
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing = false;
                                  });
                                }
                              },
                              icon: Icon(playBtn,),),
                            IconButton(
                              iconSize: 45,
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.skip_next,),)
                          ],
                        )
                      ],
                    ),
                  ),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}