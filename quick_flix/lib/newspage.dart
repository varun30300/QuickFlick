import 'package:flutter/material.dart';
import 'package:quick_flix/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  Map<String, dynamic>? jsonData;
  List<Widget> list = [const News(value: "hi")];
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchData());
  }

  Future<void> fetchData() async {
  var url = Uri.parse('http://10.0.0.115:5000/headlines'); // Replace with your API endpoint

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
        setState(() {
          this.jsonData = jsonData;
        });
        List<Widget> temp = [];
        for (var newsBody in jsonData['todayReturnObj']){
          temp.add(News(value: newsBody['title']));
        }
        List<Widget> newList = List.from(temp)..addAll(list);
        setState(() {
          list = newList;
        });
        
        // list = [const News(value: "1"), const News(value: "2"), const News(value: "3"), const News(value: "4")];
    } else {
        print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
      print('Error retrieving JSON data: $error');
    }
  }

  // Future<List<dynamic>> fetchNews() async {
  // var result = await http.get(Uri.parse("http://localhost:5000/headlines"));
  // return jsonDecode(result.body)['results'];
  // }

  void printSize(){
    print(jsonData?['todayReturnObj']);
  }

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: list,
      ),
      floatingActionButton: Container(
        child: ElevatedButton(
          onPressed: printSize,
          child: const Text("Hello"),
        ),
      )
    );
  }
}