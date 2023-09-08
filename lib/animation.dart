import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  double? _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

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
            print('DETAILS.DELTA.DY: ${details.delta.dy}');
            Navigator.push(context, FadeRoute(page: Screen1()));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Screen1(),
            //     ));

            // The user is scrolling downwards
            // Add your logic here
          }
        },
        // onVerticalDragUpdate: (details) {
        //   if (details.localPosition.dy > 450) {
        //     print('Dragged');
        //     print(
        //         'DETAILS.VELOCITY.PIXELSPERSECOND.DY: ${details.localPosition.dy}');
        //     // // User dragged downwards
        //     // Add your code here
        //   }
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
