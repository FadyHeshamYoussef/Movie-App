import 'package:flutter/material.dart';
import 'view/movie/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const MovieView(),
    );
  }
}

