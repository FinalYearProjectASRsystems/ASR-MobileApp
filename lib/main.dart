import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:just_audio/just_audio.dart' ;
import 'package:assets_audio_player/assets_audio_player.dart';

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
                              leading: Icon(Icons.tips_and_updates),
                              title: Text('Tutorial'),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>AccessibilityOptionsPage(),
                                  )  
                                );     
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        color: Colors.black, // Set the background color to black for high contrast
        child: ListView.builder(
          itemCount: filenames.length,
          itemBuilder: (BuildContext context, int index) {
            final filename = filenames[index];
            return InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              filename,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Set the text color to black for high contrast
                              ),
                            ),
                            SizedBox(height: 16.0),
                            IconButton(
                              icon: Icon(Icons.play_arrow),
                              onPressed: () {
                                // Add audio playback logic here
                              },
                              color: Colors.black, // Set the icon color to black for high contrast
                            ),
                            SizedBox(height: 16.0),
                            TextField(
                              readOnly: true,
                              style: TextStyle(
                                color: Colors.black, // Set the text color to black for high contrast
                              ),
                              decoration: InputDecoration(
                                labelText: 'Your text here',
                                labelStyle: TextStyle(
                                  color: Colors.black, // Set the label color to black for high contrast
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black, // Set the border color to black for high contrast
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle translation logic here
                              },
                              child: Text('Translate to English'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black, // Set the button background color to black for high contrast
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Set the container background color to white for high contrast
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    filename,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set the text color to black for high contrast
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



/*class TranscriptionHistoryPage extends StatelessWidget {
  final List<String> filenames = [
    'Transcription 1',
    'Transcription 2',
    'Transcription 3',
    // Add more filenames as needed
  ];
final assetsAudioPlayer = AssetsAudioPlayer();

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
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        color: Colors.black, // Set the background color to black for high contrast
        child: CarouselSlider(
          items: filenames.map((filename) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // Set the container background color to white for high contrast
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        filename,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Set the text color to black for high contrast
                        ),
                      ),
                      SizedBox(height: 16.0),
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          assetsAudioPlayer.open(
                            Audio("assets/audios/BlackPARADE.mp3"),
                          );
                        },
                        color: Colors.black, // Set the icon color to black for high contrast
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        readOnly: true,
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black for high contrast
                        ),
                        decoration: InputDecoration(
                          labelText: 'Your text here',
                          labelStyle: TextStyle(
                            color: Colors.black, // Set the label color to black for high contrast
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black, // Set the border color to black for high contrast
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Translate to English'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black, // Set the button background color to black for high contrast
                        ),
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
*/

class AccessibilityOptionsPage extends StatefulWidget {
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
    );
   }
  _AccessibilityOptionsPageState createState() =>
      _AccessibilityOptionsPageState();
}

class _AccessibilityOptionsPageState extends State<AccessibilityOptionsPage> {
  bool _multilingualSupportEnabled = false;
  bool _speechToTextTranscriptionEnabled = false;
  bool _visualFeedbackEnabled = false;
  bool _textToSpeechOutputEnabled = false;
  bool _adjustablePlaybackSpeedEnabled = false;
  bool _highContrastUIEnabled = false;
  bool _keyboardNavigationEnabled = false;
  bool _alternativeInputMethodsEnabled = false;
  bool _captioningSupportEnabled = false;
  bool _accessibilityGuidelinesComplianceEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessibility Options'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Multilingual Support'),
            subtitle: Text('Provide support for multiple languages'),
            trailing: Switch(
              value: _multilingualSupportEnabled,
              onChanged: (value) {
                setState(() {
                  _multilingualSupportEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.record_voice_over),
            title: Text('Speech-to-Text Transcription'),
            subtitle: Text('Ensure accurate conversion of spoken language to text'),
            trailing: Switch(
              value: _speechToTextTranscriptionEnabled,
              onChanged: (value) {
                setState(() {
                  _speechToTextTranscriptionEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text('Visual Feedback'),
            subtitle: Text('Display visual cues during speech recognition'),
            trailing: Switch(
              value: _visualFeedbackEnabled,
              onChanged: (value) {
                setState(() {
                  _visualFeedbackEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Text-to-Speech Output'),
            subtitle: Text('Convert transcriptions to spoken words'),
            trailing: Switch(
              value: _textToSpeechOutputEnabled,
              onChanged: (value) {
                setState(() {
                  _textToSpeechOutputEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.speed),
            title: Text('Adjustable Playback Speed'),
            subtitle: Text('Option to adjust audio playback speed'),
            trailing: Switch(
              value: _adjustablePlaybackSpeedEnabled,
              onChanged: (value) {
                setState(() {
                  _adjustablePlaybackSpeedEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('High Contrast UI'),
            subtitle: Text('Design with high contrast colors'),
            trailing: Switch(
              value: _highContrastUIEnabled,
              onChanged: (value) {
                setState(() {
                  _highContrastUIEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.keyboard),
            title: Text('Keyboard Navigation'),
            subtitle: Text('Navigate using keyboard inputs'),
            trailing: Switch(
              value: _keyboardNavigationEnabled,
              onChanged: (value) {
                setState(() {
                  _keyboardNavigationEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.gesture),
            title: Text('Alternative Input Methods'),
            subtitle: Text('Support gesture-based controls or voice commands'),
            trailing: Switch(
              value: _alternativeInputMethodsEnabled,
              onChanged: (value) {
                setState(() {
                  _alternativeInputMethodsEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.closed_caption),
            title: Text('Captioning Support'),
            subtitle: Text('Display captions alongside audio or transcriptions'),
            trailing: Switch(
              value: _captioningSupportEnabled,
              onChanged: (value) {
                setState(() {
                  _captioningSupportEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.accessibility_new),
            title: Text('Accessibility Guidelines Compliance'),
            subtitle: Text('Adhere to accessibility guidelines and standards'),
            trailing: Switch(
              value: _accessibilityGuidelinesComplianceEnabled,
              onChanged: (value) {
                setState(() {
                  _accessibilityGuidelinesComplianceEnabled = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
