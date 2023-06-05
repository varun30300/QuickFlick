import 'package:flutter/material.dart';
import 'package:quick_flix/news.dart';

class NewsPage extends StatelessWidget {
  NewsPage({super.key});

  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: const [
          News(value : "1"),
          News(value : "2"),
          News(value : "3"),
          News(value : "4"),
          News(value : "Joe Mama Gay"),
        ],
      ),
    );
  }
}