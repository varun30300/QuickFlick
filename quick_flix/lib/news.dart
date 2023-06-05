import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final String value;

  const News({
    Key? key, 
    required this.value
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(value);
  }
}