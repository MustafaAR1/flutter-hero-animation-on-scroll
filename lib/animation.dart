import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: GestureDetector(
        child: Hero(
          tag: 'tag',
          transitionOnUserGestures: true,
          child: Image.network(
              'https://www.state.gov/wp-content/uploads/2023/07/shutterstock_1953209581v2.jpg',
              height: 1000),
        ),
        onPanUpdate: (DragUpdateDetails details) {
          if (details.delta.dy < -5) {
            Navigator.push(context, FadeRoute(page: const Screen1()));
          }
        },
        // },
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
