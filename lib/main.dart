import 'package:dating_app/core/constant/Theme/dating_colors.dart';
import 'package:dating_app/core/presentation/screens/mainPages/bottom_pages/main_screen.dart';
import 'package:dating_app/core/presentation/screens/mainPages/lobby_screen.dart';
import 'package:dating_app/core/presentation/screens/subPages/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dating App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: DatingColors.primaryclr),
      ),
      // home: LobbyPage(),
      home: StartPage(),
    );
  }
}
