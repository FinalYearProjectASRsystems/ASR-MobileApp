import 'package:flutter/material.dart';

class CardExampleApp extends StatelessWidget {
  final String asrResultValue;

  CardExampleApp({required this.asrResultValue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(
                'Transcribed Twi',
                style: TextStyle(fontFamily: 'NotoSans', fontSize: 18),
              ),
              subtitle: Text(
                asrResultValue,
                style: TextStyle(fontFamily: 'NotoSans'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Copy',
                    style: TextStyle(fontFamily: 'NotoSans'),
                  ),
                  onPressed: () {/* ... */},
                ),
                SizedBox(width: 8),
                TextButton(
                  child: Text(
                    'Translate',
                    style: TextStyle(fontFamily: 'Noto Sans'),
                  ),
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
