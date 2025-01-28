import 'package:flutter/material.dart';

class TestttScreen extends StatelessWidget {
  const TestttScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tttt'),
      ),
      body: Column(
        children: [
          Text(
            " tttttt",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
