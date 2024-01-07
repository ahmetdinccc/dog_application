import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dog App"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
