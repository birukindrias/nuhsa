import 'package:fla/user/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const home());
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    const title = 'Nuhs Home';
    var currentPage = 0;
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const Text('wellcom back our service will start soon see you')
      ),
    );
  }
}
