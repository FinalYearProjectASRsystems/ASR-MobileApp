// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:just_audio/just_audio.dart' ;
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const HomePageUI());
}

class HomePageUI extends StatelessWidget {
  const HomePageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page UI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        hintColor: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: _toggleCardExpansion,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 80),
                          width: isCardExpanded ? 400 : 200,
                          height: isCardExpanded ? 600 : 200,
                          decoration: BoxDecoration(
                            color: isCardExpanded
                                ? const Color.fromARGB(255, 149, 234, 234)
                                : const Color.fromARGB(255, 113, 141, 184),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: isCardExpanded
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Transcribed Twi',
                                        
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color.fromARGB(255, 11, 186, 84),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                const Color.fromARGB(255, 42, 225, 76).withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: const Center(
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
                                    const Text(
                                      'Press to Record',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromARGB(255, 49, 205, 233),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
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
                          color: const Color.fromARGB(244, 2, 2, 2),
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
                            const SizedBox(height: 48.0),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Menu',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.history),
                              title: const Text('Transcription History'),
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
                              leading: const Icon(Icons.tips_and_updates),
                              title: const Text('Tutorial'),
                              onTap: () {
                                // Handle menu item click
                                _toggleMenu();
                        
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.accessibility),
                              title: const Text('Accessibility Features'),
                              onTap: () {
                                // Handle menu item click
                                 _toggleMenu();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>const AccessibilityOptionsPage(),
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

 TranscriptionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcription History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home page
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        color: const Color.fromARGB(255, 202, 228, 240), // Set the background color to black for high contrast
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
                      content: SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              filename,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Set the text color to black for high contrast
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                // Add audio playback logic here
                              },
                              color: Colors.black, // Set the icon color to black for high contrast
                            ),
                            const SizedBox(height: 16.0),
                            const TextField(
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
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle translation logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black, // Set the button background color to black for high contrast
                              ),
                              child: const Text('Translate to English'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Set the container background color to white for high contrast
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    filename,
                    style: const TextStyle(
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
  const AccessibilityOptionsPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcription History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the home page
          },
        ),
      ),
    );
   }
  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Accessibility Options'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Multilingual Support'),
            subtitle: const Text('Provide support for multiple languages'),
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
            leading: const Icon(Icons.record_voice_over),
            title: const Text('Speech-to-Text Transcription'),
            subtitle: const Text('Ensure accurate conversion of spoken language to text'),
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
            leading: const Icon(Icons.visibility),
            title: const Text('Visual Feedback'),
            subtitle: const Text('Display visual cues during speech recognition'),
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
            leading: const Icon(Icons.volume_up),
            title: const Text('Text-to-Speech Output'),
            subtitle: const Text('Convert transcriptions to spoken words'),
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
            leading: const Icon(Icons.speed),
            title: const Text('Adjustable Playback Speed'),
            subtitle: const Text('Option to adjust audio playback speed'),
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
            leading: const Icon(Icons.palette),
            title: const Text('High Contrast UI'),
            subtitle: const Text('Design with high contrast colors'),
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
            leading: const Icon(Icons.keyboard),
            title: const Text('Keyboard Navigation'),
            subtitle: const Text('Navigate using keyboard inputs'),
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
            leading: const Icon(Icons.gesture),
            title: const Text('Alternative Input Methods'),
            subtitle: const Text('Support gesture-based controls or voice commands'),
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
            leading: const Icon(Icons.closed_caption),
            title: const Text('Captioning Support'),
            subtitle: const Text('Display captions alongside audio or transcriptions'),
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
            leading: const Icon(Icons.accessibility_new),
            title: const Text('Accessibility Guidelines Compliance'),
            subtitle: const Text('Adhere to accessibility guidelines and standards'),
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
