
import 'package:flutter/material.dart';
import 'package:dog_application/Bloc/dog_cubit.dart';
import 'package:dog_application/Pages/bottomnavbar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage());
  }
}
