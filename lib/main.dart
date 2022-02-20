import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dansp Lab',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Dansp Lab'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF005F40),
        child: Center(

          child: InkWell(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedContainer(
              width: selected ? 300.0 : 400.0,
              height: selected ? 200.0 : 400.0,
              alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/Original_small.png', width: 400),
                  selected ? const Text(
                    'UNDER CONSTRUCTION', style: TextStyle(color: Colors.white, fontSize: 23),
                  ) : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
