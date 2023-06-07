import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:nba_api/first_screen.dart';

import 'home_page.dart';

void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: FirstPage(),
    );
  }
}
