import 'package:flutter/material.dart';
import 'codingAdvices.dart';


void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Whats not to do!!",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: HomeWidget(title: "Whats not to do!!"),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key, required this.title});

  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/homeBG.avif",
            height: .infinity,
            fit: .cover,
          ),
          CodingAdvices(),
        ],
      ),
    );
  }
}