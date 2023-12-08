import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_size_observer/widget_size_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool offstage = false;
  String message = "";
  int line = 1;
  Size? size;

  @override
  void initState() {
    super.initState();
    line = 3;
    message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\n" * line;
  }

  void _incrementCounter() {
    setState(() {
      line = Random().nextInt(20);
      message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\n" * line;
    });
  }


  @override
  Widget build(BuildContext context) {
    Offstage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text("TextSize = $size"),
          const Placeholder(fallbackHeight: 100,),
          if (true) WidgetSizeObserver(
            offstage: offstage,
            onSizeChanged: (size) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  this.size = size;
                });
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange, width: 2),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(message),
            ),
          ),
          const Placeholder(fallbackHeight: 100,),
        ],),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "offstage",
            onPressed: () {
              setState(() {
                offstage = !offstage;
              });
            },
            child: const Icon(Icons.remove_red_eye),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.refresh),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
