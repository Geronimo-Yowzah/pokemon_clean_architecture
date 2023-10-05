import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key, required this.title});

  final String title;

  @override
  State<SearchPokemonPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchPokemonPage> {
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
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            context.go('/');
          } ,
        ) ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Pokemon')],
        ),
      ),
    );
  }
}
