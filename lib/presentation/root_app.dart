import 'package:eyewear/presentation/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, fontFamily: "Poppins"),
      title: "Eyewear Store",
      home: ScreenMain(),
    );
  }
}
