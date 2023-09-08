import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Hero(
            tag: 'tag',
            child: Image.network(
                'https://www.state.gov/wp-content/uploads/2023/07/shutterstock_1953209581v2.jpg',
                width: 500,
                height: 100),
          ),
        ],
      ),
    );
  }
}
