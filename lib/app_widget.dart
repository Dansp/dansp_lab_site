import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     debugShowCheckedModeBanner: false,
      title: 'Dansp Lab',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}
