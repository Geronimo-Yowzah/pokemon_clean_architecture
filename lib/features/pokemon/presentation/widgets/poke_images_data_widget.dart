import 'package:flutter/material.dart';

class PokeImagesDataWidget extends StatefulWidget {
  final Widget child;
  final String picUrl;

  const PokeImagesDataWidget({super.key,required this.child,required this.picUrl});

  @override
  State<PokeImagesDataWidget> createState() => _PokeImagesDataWidget();
}

class _PokeImagesDataWidget extends State<PokeImagesDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.red,
        image: DecorationImage(
          image: NetworkImage(widget.picUrl),
        ),
      ),
      child: widget.child,
    );
  }
}