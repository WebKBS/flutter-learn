import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/proxy/v2zm-wX9m3mGQLzw7_5dhFDqEwnWNL615obK5Rd1mUhMkJahR5j6XdsyaBJQt8m7Jb4A9atWxdKYoAS0VQMiphotDnKWpo1L8JqHRbTgoahpGzY3xg"),
              ),
              Text(
                "Hello",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
