import 'package:flutter/material.dart';
import 'package:weight_tracker/Views/graphPage/history_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("TRACK YOUR WEIGHT")),
      body: const HistoryScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return null;
        },
      ),
    );
  }
}
