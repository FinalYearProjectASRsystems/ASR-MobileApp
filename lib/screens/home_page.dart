import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'dart:async';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:asr_ui/screens/homechat.dart';

import 'accessibility_options_page.dart';
import 'transcription_history_page.dart';

class HomePage extends StatefulWidget {
  final bool initialMultilingualSupportEnabled;
  final bool initialSpeechToTextTranscriptionEnabled;
  final bool initialVisualFeedbackEnabled;
  final bool initialTextToSpeechOutputEnabled;
  final bool initialAdjustablePlaybackSpeedEnabled;
  final bool initialHighContrastUIEnabled;
  final bool initialKeyboardNavigationEnabled;
  final bool initialAlternativeInputMethodsEnabled;
  final bool initialCaptioningSupportEnabled;
  final bool initialAccessibilityGuidelinesComplianceEnabled;

  HomePage({
    this.initialMultilingualSupportEnabled = false,
    this.initialSpeechToTextTranscriptionEnabled = false,
    this.initialVisualFeedbackEnabled = false,
    this.initialTextToSpeechOutputEnabled = false,
    this.initialAdjustablePlaybackSpeedEnabled = false,
    this.initialHighContrastUIEnabled = false,
    this.initialKeyboardNavigationEnabled = false,
    this.initialAlternativeInputMethodsEnabled = false,
    this.initialCaptioningSupportEnabled = false,
    this.initialAccessibilityGuidelinesComplianceEnabled = false,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isRecording = false; // Added for recording functionality
  bool isPlaying = false; // Added for audio playback
  double audioProgress = 0.0; // Added for audio progress
  bool isCardExpanded = false;
  bool isMenuOpen = false;
  late AnimationController _buttonController;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  String audioPath = '';

  bool multilingualSupportEnabled = false;
  bool textState1 = true;
  bool textState2 = false;
  late bool speechToTextTranscriptionEnabled;
  late bool visualFeedbackEnabled;
  late bool textToSpeechOutputEnabled;
  late bool adjustablePlaybackSpeedEnabled;
  late bool highContrastUIEnabled;
  late bool keyboardNavigationEnabled;
  late bool alternativeInputMethodsEnabled;
  late bool captioningSupportEnabled;
  late bool accessibilityGuidelinesComplianceEnabled;

  void _toggleCardExpansion() {
    setState(() {
      if (isRecording) {
        _toggleRecording(); // Stop Recording
        _toggleCompute(); // Toggle audio features
      } else {
        _toggleCompute(); // Toggle audio features
        _toggleRecording(); // Start Recording
      }
    });
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  Future<void> _toggleMultilingualSupport(bool value) async {
    setState(() {
      multilingualSupportEnabled = value;
      textState1 = !value;
      textState2 = value;
    });
    textState1 = !value;
    textState2 = value;
  }

  void _toggleSpeechToTextTranscription(bool value) {
    setState(() {
      speechToTextTranscriptionEnabled = value;
    });
  }

  void _toggleVisualFeedback(bool value) {
    setState(() {
      visualFeedbackEnabled = value;
    });
  }

  void _toggleTextToSpeechOutput(bool value) {
    setState(() {
      textToSpeechOutputEnabled = value;
    });
  }

  void _toggleAdjustablePlaybackSpeed(bool value) {
    setState(() {
      adjustablePlaybackSpeedEnabled = value;
    });
  }

  void _toggleHighContrastUI(bool value) {
    setState(() {
      highContrastUIEnabled = value;
    });
  }

  void _toggleKeyboardNavigation(bool value) {
    setState(() {
      keyboardNavigationEnabled = value;
    });
  }

  void _toggleAlternativeInputMethods(bool value) {
    setState(() {
      alternativeInputMethodsEnabled = value;
    });
  }

  void _toggleCaptioningSupport(bool value) {
    setState(() {
      captioningSupportEnabled = value;
    });
  }

  void _toggleAccessibilityGuidelinesCompliance(bool value) {
    setState(() {
      accessibilityGuidelinesComplianceEnabled = value;
    });
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
  }

  void _togglePlayback() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _toggleCompute() {
    setState(() {
      // Reset audio playback features
      isPlaying = true;
      audioProgress = 0.0;
      // Toggle visibility of audio features
      isCardExpanded = !isCardExpanded;
    });
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    multilingualSupportEnabled = widget.initialMultilingualSupportEnabled;
    speechToTextTranscriptionEnabled =
        widget.initialSpeechToTextTranscriptionEnabled;
    visualFeedbackEnabled = widget.initialVisualFeedbackEnabled;
    textToSpeechOutputEnabled = widget.initialTextToSpeechOutputEnabled;
    adjustablePlaybackSpeedEnabled =
        widget.initialAdjustablePlaybackSpeedEnabled;
    highContrastUIEnabled = widget.initialHighContrastUIEnabled;
    keyboardNavigationEnabled = widget.initialKeyboardNavigationEnabled;
    alternativeInputMethodsEnabled =
        widget.initialAlternativeInputMethodsEnabled;
    captioningSupportEnabled = widget.initialCaptioningSupportEnabled;
    accessibilityGuidelinesComplianceEnabled =
        widget.initialAccessibilityGuidelinesComplianceEnabled;
  }

  @override
  void dispose() {
    _buttonController.dispose(); // Dispose the animation controller
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        _toggleRecording();
      }
    } catch (e) {
      print('Error Start recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('error stopping recording: $e');
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error playing record: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASR FRONTEND'),
      ),
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),

              /* Row(children: <Widget> [
Text('  ')
  ],),
  SizedBox(height:10),
  Container(
    padding: EdgeInsets.all(20.0),
    child: Text('Save'),
      decoration: BoxDecoration(
      color: Colors.cyan,
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8.0),
      ),

  ),*/
              NiceButtons(
                stretch: false,
                progress: true,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  print('On tap called');
                  Timer(Duration(seconds: 5), () {
                    finish();
                  });
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              /*Container(
    padding: EdgeInsets.all(30.0),
    child: Text('Translate To English'),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 238, 195, 5),
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8.0),
      ),


  ),*/
              const SizedBox(width: double.infinity, height: 10),
              NiceButtons(
                stretch: false,
                gradientOrientation: GradientOrientation.Vertical,
                onTap: (finish) {
                  print('On tap called');
                },
                child: Text(
                  'Translate to English',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: GestureDetector(
/*onTap: () {
                        if (isRecording) {
                    
                          _toggleRecording();
                          _toggleCompute(); 
                        } else {
                          _toggleCompute(); 
                          _toggleRecording();
                        }
                      },*/ //commented out ontap detector for the whole container
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: isCardExpanded ? 250 : 200,
                          height: isCardExpanded ? 250 : 200,
                          decoration: BoxDecoration(
                            color: isCardExpanded
                                ? Color.fromARGB(255, 250, 234, 7)
                                : Color.fromARGB(80, 24, 9, 235),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: isCardExpanded
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    isRecording
                                        ? ElevatedButton(
                                            onPressed: () {
                                              // Stop Recording logic
                                              stopRecording();
                                            },
                                            child:
                                                Text('Press to Stop Recording'),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    if (isPlaying)
                                      Column(
                                        children: [
                                          Slider(
                                            value: audioProgress,
                                            onChanged: (double value) {
                                              setState(() {
                                                audioProgress = value;
                                              });
                                            },
                                          ),
                                          SizedBox(height: 8.0),
                                          Container(
                                            width: 120,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (!isRecording &&
                                                    audioPath != null)
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 32,
                                                    ),
                                                    onPressed: playRecording,
                                                  ),
                                                /*IconButton(
                                                icon: Icon(
                                                  Icons.volume_up,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  // Mute Button logic
                                                },
                                              ),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    /*ElevatedButton(
                                    onPressed:() {
                                    _toggleRecording();
                                    },

                                    child: Text('Compute'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange,
                                  ),
                                  ),*/
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Visibility(
                                      visible: textState1,
                                      child: Text(
                                        'Press to Record',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: textState2,
                                      child: Text(
                                        'Mia na kasa',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
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
                                            Icons.mic,
                                            color: const Color.fromARGB(
                                                255, 110, 81, 81),
                                            size: 32,
                                          ),
                                          onPressed: () {
                                            startRecording();
                                            _toggleCardExpansion();
                                          }),
                                    ),
                                  ],
                                )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Automatic Speech Recognition',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: const Text('Transcription History'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TranscriptionHistoryPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.tips_and_updates),
            title: Text('Chatbot'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeChat()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('Accessibility Features'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccessibilityOptionsPage(
                      toggleMultilingualSupport: _toggleMultilingualSupport,
                      multilingualSupportEnabled: multilingualSupportEnabled,
                      toggleSpeechToTextTranscription:
                          _toggleSpeechToTextTranscription,
                      speechToTextTranscriptionEnabled:
                          speechToTextTranscriptionEnabled,
                      toggleVisualFeedback: _toggleVisualFeedback,
                      visualFeedbackEnabled: visualFeedbackEnabled,
                      toggleTextToSpeechOutput: _toggleTextToSpeechOutput,
                      textToSpeechOutputEnabled: textToSpeechOutputEnabled,
                      toggleAdjustablePlaybackSpeed:
                          _toggleAdjustablePlaybackSpeed,
                      adjustablePlaybackSpeedEnabled:
                          adjustablePlaybackSpeedEnabled,
                      toggleHighContrastUI: _toggleHighContrastUI,
                      highContrastUIEnabled: highContrastUIEnabled,
                      toggleKeyboardNavigation: _toggleKeyboardNavigation,
                      keyboardNavigationEnabled: keyboardNavigationEnabled,
                      toggleAlternativeInputMethods:
                          _toggleAlternativeInputMethods,
                      alternativeInputMethodsEnabled:
                          alternativeInputMethodsEnabled,
                      toggleCaptioningSupport: _toggleCaptioningSupport,
                      captioningSupportEnabled: captioningSupportEnabled,
                      toggleAccessibilityGuidelinesCompliance:
                          _toggleAccessibilityGuidelinesCompliance,
                      accessibilityGuidelinesComplianceEnabled:
                          accessibilityGuidelinesComplianceEnabled,
                    ),
                  ));
            },
          ),
        ],
      )),
    );
  }
}
