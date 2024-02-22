import 'package:chat_bot/chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlays to FullScreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Get Size of device
    double widthScreenDevice = MediaQuery.of(context).size.width;
    double heightScreenDevice = MediaQuery.of(context).size.height;
    if ((widthScreenDevice > 0) && (heightScreenDevice > 0)) {
      print(widthScreenDevice);
    }
    // This code to handle error Flutter bug when it returns the
    // widthScreenDevice/heightScreenDevice = 0
    if (widthScreenDevice == 0 || heightScreenDevice == 0) {
      return const MaterialApp(
        home: Center(
          child: Text("Loading..."),
        ),
        debugShowCheckedModeBanner: false,
      );
    } else {
      return const MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ChatBot());
  }
}
