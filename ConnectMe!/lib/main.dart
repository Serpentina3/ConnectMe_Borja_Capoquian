import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireless App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ConnectMe!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOn = true;
  bool _isExpanded = false;

  void _togglePower() {
    setState(() {
      _isOn = !_isOn;
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Touch Pad')),
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_isOn
                ? Icons.power_settings_new
                : Icons.power_settings_new_outlined),
            onPressed: () {
              _togglePower();
            },
          )
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) {
            print(details.globalPosition);
          },
          child: Container(
            width: 280,
            height: 480,
            color: Color(0xff252344),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isExpanded) ...[
            FloatingActionButton(
              onPressed: _toggleExpanded,
              child: Icon(Icons.close),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('No Content')));
              },
              child: Icon(Icons.settings_outlined),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('No Content')));
              },
              child: Icon(Icons.connected_tv_rounded),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                // Perform action
              },
              child: Icon(Icons.remove),
            ),
          ] else ...[
            FloatingActionButton(
              onPressed: _toggleExpanded,
              child: Icon(Icons.menu_rounded),
            ),
          ],
        ],
      ),
    );
  }
}
