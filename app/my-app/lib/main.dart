import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora App',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 155, 142, 142))),
      home: const Intro(),
    );
  }
}
