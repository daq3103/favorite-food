import 'package:flutter/material.dart';
import 'package:testtheme/screen/ChangeScreen.dart';
import 'package:testtheme/screen/categories.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const App());
}

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple, brightness: Brightness.dark),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 200, 207, 202)
      ),
      labelLarge: GoogleFonts.merriweather(),
    ));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home:   const Scaffold(
        body: ChangeScreen(),
      ),
    );
  }
}
