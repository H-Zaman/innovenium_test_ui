import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovenium/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Innovenium',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoSansTextTheme()
      ),
      home: const HomeScreen(),
    );
  }
}