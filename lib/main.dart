import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_too/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.cairoTextTheme(const TextTheme()),
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
