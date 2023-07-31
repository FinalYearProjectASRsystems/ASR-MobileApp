import 'package:flutter/material.dart';

/// Flutter code sample for [Card].


class CardExampleApp extends StatelessWidget {
  CardExampleApp({super.key, required this.asrResultValue});
    String asrResultValue='';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             ListTile(
              leading: Icon(Icons.album),
              title: Text('Transcribed Twi'),
              subtitle: Text(asrResultValue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child:  Text('Copy'),
                  onPressed: () {/* ... */},
                ),
                 SizedBox(width: 8),
                TextButton(
                  child:  Text('Translate'),
                  onPressed: () {/* ... */},
                ),
                 SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
