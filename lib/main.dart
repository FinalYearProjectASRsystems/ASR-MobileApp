import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

class _HomePageState extends State<HomePage> {
  bool isCardExpanded = false;
  bool isMenuOpen = false;
  
 late bool multilingualSupportEnabled;
 late bool textState1;
  late bool textState2;
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
      isCardExpanded = !isCardExpanded;
    });
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void _toggleMultilingualSupport(bool value) {
    setState(() {
      multilingualSupportEnabled = value;
      textState1 = !value;
      textState2 = value;
    });
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

  @override
   void initState() {
    super.initState();
     multilingualSupportEnabled = widget.initialMultilingualSupportEnabled;
    speechToTextTranscriptionEnabled = widget.initialSpeechToTextTranscriptionEnabled;
    visualFeedbackEnabled = widget.initialVisualFeedbackEnabled;
    textToSpeechOutputEnabled = widget.initialTextToSpeechOutputEnabled;
    adjustablePlaybackSpeedEnabled = widget.initialAdjustablePlaybackSpeedEnabled;
    highContrastUIEnabled = widget.initialHighContrastUIEnabled;
    keyboardNavigationEnabled = widget.initialKeyboardNavigationEnabled;
    alternativeInputMethodsEnabled = widget.initialAlternativeInputMethodsEnabled;
    captioningSupportEnabled = widget.initialCaptioningSupportEnabled;
    accessibilityGuidelinesComplianceEnabled = widget.initialAccessibilityGuidelinesComplianceEnabled;
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
                                    Visibility(visible: textState1,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Transcribed Twi',
                                      ),
                                    )),
                                    Visibility(visible: textState2,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Twi nkyer3wee',
                                      ),
                                    )),
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
        color: Colors.orange.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Visibility(
        visible: textState1,
        child: Center(
          child: Text(
            'Speak',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Visibility(
        visible: textState2,
        child: Center(
          child: Text(
            'kasa',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      
    ],
  ),
),

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
                                _toggleMenu();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AccessibilityOptionsPage(
                                      toggleMultilingualSupport:
                                          _toggleMultilingualSupport,
                                      multilingualSupportEnabled:
                                          multilingualSupportEnabled,
                                      toggleSpeechToTextTranscription:
                                          _toggleSpeechToTextTranscription,
                                      speechToTextTranscriptionEnabled:
                                          speechToTextTranscriptionEnabled,
                                      toggleVisualFeedback: _toggleVisualFeedback,
                                      visualFeedbackEnabled:
                                          visualFeedbackEnabled,
                                      toggleTextToSpeechOutput:
                                          _toggleTextToSpeechOutput,
                                      textToSpeechOutputEnabled:
                                          textToSpeechOutputEnabled,
                                      toggleAdjustablePlaybackSpeed:
                                          _toggleAdjustablePlaybackSpeed,
                                      adjustablePlaybackSpeedEnabled:
                                          adjustablePlaybackSpeedEnabled,
                                      toggleHighContrastUI: _toggleHighContrastUI,
                                      highContrastUIEnabled:
                                          highContrastUIEnabled,
                                      toggleKeyboardNavigation:
                                          _toggleKeyboardNavigation,
                                      keyboardNavigationEnabled:
                                          keyboardNavigationEnabled,
                                      toggleAlternativeInputMethods:
                                          _toggleAlternativeInputMethods,
                                      alternativeInputMethodsEnabled:
                                          alternativeInputMethodsEnabled,
                                      toggleCaptioningSupport:
                                          _toggleCaptioningSupport,
                                      captioningSupportEnabled:
                                          captioningSupportEnabled,
                                      toggleAccessibilityGuidelinesCompliance:
                                          _toggleAccessibilityGuidelinesCompliance,
                                      accessibilityGuidelinesComplianceEnabled:
                                          accessibilityGuidelinesComplianceEnabled,
                                    ),
                                  ),
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

class AccessibilityOptionsPage extends StatelessWidget {
  final Function(bool) toggleMultilingualSupport;
  final bool multilingualSupportEnabled;
  final Function(bool) toggleSpeechToTextTranscription;
  final bool speechToTextTranscriptionEnabled;
  final Function(bool) toggleVisualFeedback;
  final bool visualFeedbackEnabled;
  final Function(bool) toggleTextToSpeechOutput;
  final bool textToSpeechOutputEnabled;
  final Function(bool) toggleAdjustablePlaybackSpeed;
  final bool adjustablePlaybackSpeedEnabled;
  final Function(bool) toggleHighContrastUI;
  final bool highContrastUIEnabled;
  final Function(bool) toggleKeyboardNavigation;
  final bool keyboardNavigationEnabled;
  final Function(bool) toggleAlternativeInputMethods;
  final bool alternativeInputMethodsEnabled;
  final Function(bool) toggleCaptioningSupport;
  final bool captioningSupportEnabled;
  final Function(bool) toggleAccessibilityGuidelinesCompliance;
  final bool accessibilityGuidelinesComplianceEnabled;

  AccessibilityOptionsPage({
    required this.toggleMultilingualSupport,
    required this.multilingualSupportEnabled,
    required this.toggleSpeechToTextTranscription,
    required this.speechToTextTranscriptionEnabled,
    required this.toggleVisualFeedback,
    required this.visualFeedbackEnabled,
    required this.toggleTextToSpeechOutput,
    required this.textToSpeechOutputEnabled,
    required this.toggleAdjustablePlaybackSpeed,
    required this.adjustablePlaybackSpeedEnabled,
    required this.toggleHighContrastUI,
    required this.highContrastUIEnabled,
    required this.toggleKeyboardNavigation,
    required this.keyboardNavigationEnabled,
    required this.toggleAlternativeInputMethods,
    required this.alternativeInputMethodsEnabled,
    required this.toggleCaptioningSupport,
    required this.captioningSupportEnabled,
    required this.toggleAccessibilityGuidelinesCompliance,
    required this.accessibilityGuidelinesComplianceEnabled,
  });

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
              value: multilingualSupportEnabled,
              onChanged: toggleMultilingualSupport,
                 
              ),
              
          ),
        
          ListTile(
            leading: Icon(Icons.mic),
            title: Text('Speech-to-Text Transcription'),
            subtitle: Text('Convert spoken words into text'),
            trailing: Switch(
              value: speechToTextTranscriptionEnabled,
              onChanged: toggleSpeechToTextTranscription,
            ),
          ),
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text('Visual Feedback'),
            subtitle: Text('Provide visual indicators or feedback'),
            trailing: Switch(
              value: visualFeedbackEnabled,
              onChanged: toggleVisualFeedback,
            ),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Text-to-Speech Output'),
            subtitle: Text('Convert text into spoken words'),
            trailing: Switch(
              value: textToSpeechOutputEnabled,
              onChanged: toggleTextToSpeechOutput,
            ),
          ),
          ListTile(
            leading: Icon(Icons.speed),
            title: Text('Adjustable Playback Speed'),
            subtitle: Text('Allow users to control the playback speed'),
            trailing: Switch(
              value: adjustablePlaybackSpeedEnabled,
              onChanged: toggleAdjustablePlaybackSpeed,
            ),
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('High Contrast UI'),
            subtitle: Text('Enable high contrast user interface'),
            trailing: Switch(
              value: highContrastUIEnabled,
              onChanged: toggleHighContrastUI,
            ),
          ),
          ListTile(
            leading: Icon(Icons.keyboard),
            title: Text('Keyboard Navigation'),
            subtitle: Text('Navigate the app using the keyboard'),
            trailing: Switch(
              value: keyboardNavigationEnabled,
              onChanged: toggleKeyboardNavigation,
            ),
          ),
          ListTile(
            leading: Icon(Icons.keyboard_hide),
            title: Text('Alternative Input Methods'),
            subtitle: Text('Support alternative input methods'),
            trailing: Switch(
              value: alternativeInputMethodsEnabled,
              onChanged: toggleAlternativeInputMethods,
            ),
          ),
          ListTile(
            leading: Icon(Icons.closed_caption),
            title: Text('Captioning Support'),
            subtitle: Text('Provide captions for audio and video content'),
            trailing: Switch(
              value: captioningSupportEnabled,
              onChanged: toggleCaptioningSupport,
            ),
          ),
          ListTile(
            leading: Icon(Icons.rule),
            title: Text('Accessibility Guidelines Compliance'),
            subtitle: Text('Ensure compliance with accessibility guidelines'),
            trailing: Switch(
              value: accessibilityGuidelinesComplianceEnabled,
              onChanged: toggleAccessibilityGuidelinesCompliance,
            ),
          ),
        ],
      ),
    );
  }
}
