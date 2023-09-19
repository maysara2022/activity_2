import 'package:activity_2/Widgets_Of.dart';
import 'package:flutter/material.dart';

import 'Demo_Data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetOf(
        items: DemoData().types,
        dataItems: DemoData().DataItems,
      ),
    );
  }
}
