import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        )),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.go('/search');
                },
                icon: const Icon(
                  Icons.folder_open,
                  size: 40,
                )),
            IconButton(
                onPressed: () {
                  context.go('/barchart');
                },
                icon: const Icon(
                  Icons.add_chart,
                  size: 40,
                )),
            IconButton(
                onPressed: () {
                  context.go('/piechart');
                },
                icon: const Icon(
                  Icons.pie_chart,
                  size: 40,
                )),
            IconButton(
                onPressed: () {
                  context.go('/linechart');
                },
                icon: const Icon(
                  Icons.stacked_line_chart,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
