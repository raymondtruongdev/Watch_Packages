library watchface;

import 'package:flutter/material.dart';

class WatchFace extends StatefulWidget {
  const WatchFace({super.key});

  @override
  State<WatchFace> createState() => _WatchFaceState();
}

class _WatchFaceState extends State<WatchFace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('WatchFace'),
    );
  }
}
