import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart' ;
void main() {
  runApp(HomePageUI());
}

class HomePageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        hintColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCardExpanded = false;
  bool isMenuOpen = false;

  void _toggleCardExpansion() {
    setState(() {
      isCardExpanded = !isCardExpanded;
    });
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASR FRONTEND'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _toggleMenu,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (isMenuOpen) {
            _toggleMenu();
          }
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: _toggleCardExpansion,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: isCardExpanded ? 300 : 200,
                          height: isCardExpanded ? 300 : 200,
                          decoration: BoxDecoration(
                            color: isCardExpanded
                                ? Colors.purple[200]
                                : Colors.purple[100],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: isCardExpanded
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Transcribed Twi',
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.orange.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Speak',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Press to Record',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange,
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                        onPressed: _toggleCardExpansion,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isMenuOpen)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: _toggleMenu,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 48.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.history),
                              title: Text('Transcription History'),
                              onTap: () {
                                _toggleMenu();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TranscriptionHistoryPage(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.translate),
                              title: Text('Translate to English'),
                              onTap: () {
                                // Handle menu item click
                                _toggleMenu();
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.accessibility),
                              title: Text('Accessibility Features'),
                              onTap: () {
                                // Handle menu item click
                                _toggleMenu();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TranscriptionHistoryPage extends StatelessWidget {
  final List<String> filenames = [
    'Transcription 1',
    'Transcription 2',
    'Transcription 3',
    // Add more filenames as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transcription History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home page
          },
        ),
      ),
      body: CarouselSlider(
        items: filenames.map((filename) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      filename,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    AudioPlayerWidget(audioPath: 'C:\Users\Hp\Downloads\Telegram Desktop\audio.mp3',),
                    SizedBox(height: 16.0),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Your text here',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          initialPage: 0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  AudioPlayerWidget({required this.audioPath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer.positionStream.listen((duration) {
      setState(() {
        _progress = duration.inMilliseconds.toDouble();
      });
    });
  }

  void playAudio() async {
    await _audioPlayer.setFilePath(widget.audioPath);
    await _audioPlayer.play();
  }

  void pauseAudio() async {
    await _audioPlayer.pause();
  }

  void stopAudio() async {
    await _audioPlayer.stop();
    await _audioPlayer.seek(Duration.zero);
  }

  void seekAudio(double value) async {
    await _audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _progress,
          min: 0.0,
          max: _audioPlayer.duration!.inMilliseconds.toDouble(),
          onChanged: (value) {
            setState(() {
              _progress = value;
            });
          },
          onChangeEnd: (value) {
            seekAudio(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: playAudio,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: pauseAudio,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: stopAudio,
            ),
          ],
        ),
      ],
    );
  }
}
