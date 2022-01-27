import 'package:flutter/material.dart';

class GraphyScreen extends StatefulWidget {
  const GraphyScreen({Key? key}) : super(key: key);

  @override
  _GraphyScreenState createState() => _GraphyScreenState();
}

class _GraphyScreenState extends State<GraphyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Graphy"),
      ),
      body: const Center(
        child: Text("Graphy Screen"),
      ),
    );
  }
}
