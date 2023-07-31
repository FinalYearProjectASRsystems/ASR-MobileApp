import 'package:flutter/material.dart';

class AccessibilityOptionsPage extends StatefulWidget {
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
  State<AccessibilityOptionsPage> createState() =>
      _AccessibilityOptionsPageState();
}

class _AccessibilityOptionsPageState extends State<AccessibilityOptionsPage> {
  bool multilingualSupportEnabled = false;
  bool speechToTextTranscriptionEnabled = false;
  bool visualFeedbackEnabled = false;
  bool textToSpeechOutputEnabled = false;
  bool adjustablePlaybackSpeedEnabled = false;
  bool highContrastUIEnabled = false;
  bool keyboardNavigationEnabled = false;
  bool alternativeInputMethodsEnabled = false;
  bool captioningSupportEnabled = false;
  bool accessibilityGuidelinesComplianceEnabled = false;

  @override
  void initState() {
    super.initState();
    multilingualSupportEnabled = widget.multilingualSupportEnabled;
    speechToTextTranscriptionEnabled = widget.speechToTextTranscriptionEnabled;
    visualFeedbackEnabled = widget.visualFeedbackEnabled;
    textToSpeechOutputEnabled = widget.textToSpeechOutputEnabled;
    adjustablePlaybackSpeedEnabled = widget.adjustablePlaybackSpeedEnabled;
    highContrastUIEnabled = widget.highContrastUIEnabled;
    keyboardNavigationEnabled = widget.keyboardNavigationEnabled;
    alternativeInputMethodsEnabled = widget.alternativeInputMethodsEnabled;
    captioningSupportEnabled = widget.captioningSupportEnabled;
    accessibilityGuidelinesComplianceEnabled =
        widget.accessibilityGuidelinesComplianceEnabled;
  }

  @override
  Widget build(BuildContext context) {
    Function(bool) toggleMultilingualSupport = widget.toggleMultilingualSupport;

    Function(bool) toggleSpeechToTextTranscription =
        widget.toggleSpeechToTextTranscription;
    Function(bool) toggleVisualFeedback = widget.toggleVisualFeedback;

    Function(bool) toggleTextToSpeechOutput = widget.toggleTextToSpeechOutput;

    Function(bool) toggleAdjustablePlaybackSpeed =
        widget.toggleAdjustablePlaybackSpeed;

    Function(bool) toggleHighContrastUI = widget.toggleHighContrastUI;

    Function(bool) toggleKeyboardNavigation = widget.toggleKeyboardNavigation;

    Function(bool) toggleAlternativeInputMethods =
        widget.toggleAlternativeInputMethods;

    Function(bool) toggleCaptioningSupport = widget.toggleCaptioningSupport;

    Function(bool) toggleAccessibilityGuidelinesCompliance =
        widget.toggleAccessibilityGuidelinesCompliance;

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
              onChanged: (value) async {
                await toggleMultilingualSupport(value);
                Navigator.pop(context, multilingualSupportEnabled);
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.mic),
            title: Text('Speech-to-Text Transcription'),
            subtitle: Text('Convert spoken words into text'),
            trailing: Switch(
              value: speechToTextTranscriptionEnabled,
              onChanged: (value) {
                setState(() {
                  speechToTextTranscriptionEnabled = value;
                  toggleSpeechToTextTranscription(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text('Visual Feedback'),
            subtitle: Text('Provide visual indicators or feedback'),
            trailing: Switch(
              value: visualFeedbackEnabled,
              onChanged: (value) {
                setState(() {
                  visualFeedbackEnabled = value;
                  toggleVisualFeedback(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Text-to-Speech Output'),
            subtitle: Text('Convert text into spoken words'),
            trailing: Switch(
                value: textToSpeechOutputEnabled,
                onChanged: (value) {
                  setState(() {
                    textToSpeechOutputEnabled = value;
                    toggleTextToSpeechOutput(value);
                  });
                }),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.speed),
            title: Text('Adjustable Playback Speed'),
            subtitle: Text('Allow users to control the playback speed'),
            trailing: Switch(
                value: adjustablePlaybackSpeedEnabled,
                onChanged: (value) {
                  setState(() {
                    adjustablePlaybackSpeedEnabled = value;
                    toggleAdjustablePlaybackSpeed(value);
                  });
                }),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('High Contrast UI'),
            subtitle: Text('Enable high contrast user interface'),
            trailing: Switch(
              value: highContrastUIEnabled,
              onChanged: (value) {
                setState(() {
                  highContrastUIEnabled = value;
                  toggleHighContrastUI(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.keyboard),
            title: Text('Keyboard Navigation'),
            subtitle: Text('Navigate the app using the keyboard'),
            trailing: Switch(
              value: keyboardNavigationEnabled,
              onChanged: (value) {
                setState(() {
                  keyboardNavigationEnabled = value;
                  toggleKeyboardNavigation(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.keyboard_hide),
            title: Text('Alternative Input Methods'),
            subtitle: Text('Support alternative input methods'),
            trailing: Switch(
              value: alternativeInputMethodsEnabled,
              onChanged: (value) {
                setState(() {
                  alternativeInputMethodsEnabled = value;
                  toggleAlternativeInputMethods(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.closed_caption),
            title: Text('Captioning Support'),
            subtitle: Text('Provide captions for audio and video content'),
            trailing: Switch(
              value: captioningSupportEnabled,
              onChanged: (value) {
                setState(() {
                  captioningSupportEnabled = value;
                  toggleCaptioningSupport(value);
                });
              },
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.rule),
            title: Text('Accessibility Guidelines Compliance'),
            subtitle: Text('Ensure compliance with accessibility guidelines'),
            trailing: Switch(
              value: accessibilityGuidelinesComplianceEnabled,
              onChanged: (value) {
                setState(() {
                  accessibilityGuidelinesComplianceEnabled = value;
                  toggleAccessibilityGuidelinesCompliance(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
