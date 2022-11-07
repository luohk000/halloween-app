import 'package:flutter/material.dart';
import 'dart:math';

var rng = Random();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Happy Halloween'),
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
  int _counter = 0;
  var x = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  bool display = false;

  void _countAndVis() {
    setState(() {
      _counter++;
      int rnd = rng.nextInt(16);
      for (int i = 0; i < 3; i++) {
        int cur = rng.nextInt(16);
        if (rnd != cur) x[cur] = !x[cur];
        rnd = cur;
      }
      if (_counter > 20) display = true;
    });
  }

  Widget createRow(int offset) {
    return Row(children: <Widget>[
      createExpanded(0 + offset),
      const Spacer(),
      createExpanded(1 + offset),
      const Spacer(),
      createExpanded(2 + offset),
      const Spacer(),
      createExpanded(3 + offset)
    ]);
  }

  Widget createExpanded(inp) {
    return Expanded(
      child: Visibility(
        visible: x[inp],
        child: IconButton(
          splashRadius: 85,
          iconSize: 150,
          onPressed: _countAndVis,
          icon: Image.asset(
            'assets/pumpkin.png',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> arr = [];
    arr.add(const Center(
        child: Text("You have clicked", style: TextStyle(fontSize: 30))));
    arr.add(Center(child: Text('$_counter', style: TextStyle(fontSize: 30))));
    arr.add(const Center(
        child:
            Center(child: Text("pumpkins!", style: TextStyle(fontSize: 30)))));
    for (int i = 0; i < 4; i++) {
      arr.add(createRow(4 * i));
    }
    if (!display) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: arr),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
              child: Column(children: <Widget>[
        Text("Happy", style: TextStyle(fontSize: 100, fontFamily: "Spooky")),
        Text("Halloween",
            style: TextStyle(
                fontSize: 100, color: Colors.orange, fontFamily: "Spooky")),
        Image.asset('assets/bat.png')
      ])));
    }
  }
}
