import 'package:flutter/material.dart';

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
                            child: ListView.builder(
                              itemCount: 100, // Replace with actual item count
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('File ${index + 1}'),
                                  onTap: () {},   // Build your transcription history menu here
      );
                              }
                            )
      ),
    );
  }
}
