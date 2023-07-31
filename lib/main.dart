import 'package:flutter/material.dart';
import 'screens/home_page.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';

import 'screens/AsrCard.dart';






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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isRecording = false; // Added for recording functionality
  bool isPlaying = false; // Added for audio playback
  double audioProgress = 0.0; // Added for audio progress
  bool isCardExpanded = false;
  bool isMenuOpen = false;
  late AnimationController _buttonController;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  String audioPath= '';
  String outputPath= '';
 String _asrResult = '';
  bool _isLoading = false;
  bool multilingualSupportEnabled=false;
  bool textState1=true;
  bool textState2=false;
  late bool speechToTextTranscriptionEnabled;
  late bool visualFeedbackEnabled;
  late bool textToSpeechOutputEnabled;
  late bool adjustablePlaybackSpeedEnabled;
  late bool highContrastUIEnabled;
  late bool keyboardNavigationEnabled;
  late bool alternativeInputMethodsEnabled;
  late bool captioningSupportEnabled;
  late bool accessibilityGuidelinesComplianceEnabled;
   String statusText = "";
   bool isComputing= false;
   
  
  

void _toggleCardExpansion() {
  setState(() {
   isCardExpanded=!isCardExpanded;
    
  });
    
}


  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  Future <void> _toggleMultilingualSupport(bool value) async {
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
      isPlaying = true;
    });
  }
void _toggleCompute() {
  setState(() {
    // Reset audio playback features
    //isPlaying = !isPlaying;
    audioProgress = 0.0;
    // Toggle visibility of audio features
    isCardExpanded = !isCardExpanded;
  });
}

  @override
   void initState() {
    audioPlayer= AudioPlayer();
      audioRecord= Record();
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),);
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
  void dispose() {
    _buttonController.dispose(); // Dispose the animation controller
       audioRecord.dispose();
       audioPlayer.dispose();
     super.dispose();
  }
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
/*Future<void> startRecording() async{
    try{
if(await)
{
  await audioRecord.start();
 _toggleRecording();
      Fluttertoast.showToast(msg: 'Recording started');
}
    }
    catch(e){
      print('Error Start recording: $e');
       Fluttertoast.showToast(msg: 'Error starting recording');
    }
  }*/
  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
  
  void startRecording() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      recordFilePath = await getFilePath();
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {
        });
      });
    } else {
      Fluttertoast.showToast(msg:"No microphone permission");
    }
    setState(() {});
  }
 /* Future<void> stopRecording() async{
    try{
      String? path= await audioRecord.stop();
      audioPath = path!;
      Fluttertoast.showToast(msg:'$audioPath');
      await convertToMp3(audioPath);
setState((){
  isRecording= false;
   audioPath = path!;
    Fluttertoast.showToast(msg: 'Recording stopped');
});    

    }
    catch(e){
      print('error stopping recording: $e');
      Fluttertoast.showToast(msg: 'Error stopping recording');
    }
  }
*/
 void stopRecording() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      setState(() {
         isRecording= false;
         Fluttertoast.showToast(msg: 'Recording stopped');
      });
    }
  }

/*Future<void> playRecording() async{
try{
  Source urlSource = UrlSource(audioPath);
  await audioPlayer.play(urlSource);
}
catch(e){
print('Error playing record: $e');
 Fluttertoast.showToast(msg: 'Error playing recording');

}

}*/
String recordFilePath="";
void playRecording() {
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      Source filePathUrl = UrlSource(recordFilePath);
      audioPlayer.play(filePathUrl);
    }
  }


/*Future<void> saveRecording() async {
  if (audioPath != null) {
    
    try {
      // Get the app's documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();

      // Create a new file with the current timestamp as the name
      File recordingFile = File('${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp3');

      // Copy the recorded audio file to the new location
      await File(audioPath!).copy(recordingFile.path);

      Fluttertoast.showToast(msg: 'Recording saved successfully');
    } catch (e) {
      print('Error saving recording: $e');
      Fluttertoast.showToast(msg: 'Error saving recording');
    }
  } else {
    Fluttertoast.showToast(msg: 'No recording to save');
  }
}*/
/*Future<Map<String, dynamic>> query(String audioPath) async {
  final data =  File(audioPath).readAsBytesSync();
  final url = Uri.parse(
      'https://api-inference.huggingface.co/models/ayertey01/wav2vec2-large-xlsr-53-AsanteTwi-07');

  final response = await http.post(
    url,
    headers: {"Authorization": "Bearer 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",
    "Content-Type":"audio/flac",
    },
    body: data,
  );

  if (response.statusCode == 200) {
Fluttertoast.showToast(msg: 'Audio transcribed');
    return json.decode(response.body);
    
  } else {
    throw Exception('Failed to transcribe audio.');
  }
}*/
final String apiURL =
    "https://api-inference.huggingface.co/models/ayertey01/wav2vec2-large-xlsr-53-AsanteTwi-06second";
final String apiToken = "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";

Future<Map<String, dynamic>> query(String audioPath) async {
  final File file = File(audioPath);
  final List<int> data = await file.readAsBytes();

  final Map<String, String> headers = {
    "Authorization": "Bearer $apiToken",
    "Content-Type": "audio/mp3", // Modify this if your file format is different
  };

  final http.Response response =
      await http.post(Uri.parse(apiURL), headers: headers, body: data);

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Audio transcribed');
    return json.decode(response.body);
    

  } else {
    throw Exception('Failed to query API. Status code: ${response.statusCode}');
  }
}



/*void main() async {
  final apiToken = 'Bearer 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';
  final result = await query(outputPath, apiToken);
 String AsrResult= (json.encode(result));
}*/

/*Future<void> convertToMp3(String inputPath) async {
  try {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String outputPath = '${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp3';

    await FFmpegKit.executeAsync('-i $inputPath -c:a libmp3lame $outputPath');

    // Check if the output file was created
    bool outputFileExists = await File(outputPath).exists();

    if (outputFileExists) {
      // Conversion successful
      Fluttertoast.showToast(msg: 'Conversion to mp3 successful');
      setState(() {
        audioPath = outputPath;
      });

      Fluttertoast.showToast(msg: '$audioPath');
    } else {
      // Conversion failed
      Fluttertoast.showToast(msg: 'Error converting audio to mp3');
    }
  } catch (e) {
    print('Error converting audio: $e');
    Fluttertoast.showToast(msg: 'Error converting audio');
  }
}*/



 Future<void> queryAsr() async {
    try {
//final apiToken = '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';
      Map<String, dynamic> output = await query(recordFilePath);
      _asrResult= jsonEncode(output);
      // Do something with the asrResult (e.g., store it in a state variable)
     /* setState(() {
        // Store the ASR result in a state variable
       _asrResult = asrResult;
      });*/
    } catch (e) {
      print('Error querying ASR: $e');
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'), 
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
          alignment: Alignment.topRight,
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
children:<Widget> [
   SizedBox(
      height: 10,),

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
               // saveRecording();
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
   Container(width: double.infinity, height: 10),
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
                                            onPressed: (){
                                              stopRecording();
                                             _togglePlayback();
                                             },
                                             
                                              // Stop Recording logic
                                            child: Text('Press to Stop Recording'),
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
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                if(!isRecording && audioPath != null)
                                                IconButton(
                                                  icon: Icon(
                                                   Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                  onPressed:playRecording,
                                        
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.volume_up,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                  onPressed: (){}
                                                ),
                                                         ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      if(isPlaying)
                                      Column(
                                        children: [
                                          NiceButtons(
              stretch: false,
              progress: true,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                queryAsr();
               Navigator.push(
                                       context,
                                  MaterialPageRoute(builder: (context) => CardExampleApp(asrResultValue:_asrResult)),
                                                  );
                Timer(Duration(seconds: 5), () {
                  finish();
                });
              },
              child: Text(
                'Compute',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
                                        ],
                                      )
                              
                                  ],
                                )
                                                    // Mute Button logic
                                      
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
                                          color: const Color.fromARGB(255, 110, 81, 81),
                                          size: 32,
                                        ),
                                        onPressed:() {startRecording();
                                         _toggleRecording();
                                        _toggleCardExpansion();
                                       }
                                        
                                      ),
                                    ),
                                  ],
                                )
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
                              leading: Icon(Icons.chat),
                              title: Text('Chatroom'),
                              onTap: () {
                                 _toggleMenu();
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
                      )
                      
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
                              child: Text('New Recording'),
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
              onChanged: (value) async{
                await toggleMultilingualSupport(value);
                Navigator.pop(context,multilingualSupportEnabled);
              },
                 
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
