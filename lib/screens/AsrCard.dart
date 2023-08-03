import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CardExampleApp extends StatelessWidget {
   String asrResultValue;

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
                style: GoogleFonts.lobster
                (textStyle: TextStyle(fontFamily: 'NotoSans', fontSize: 18),)
              ),
              subtitle: Text(
                asrResultValue,
                style: GoogleFonts.laBelleAurore
                (textStyle: TextStyle(fontFamily: 'NotoSans', fontSize: 24),)
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text(
                    '',
                    style: TextStyle(fontFamily: 'NotoSans'),
                  ),
                  onPressed: () {/* ... */},
                ),
                SizedBox(width: 8),
                TextButton(
                  child: Text(
                    '',
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
