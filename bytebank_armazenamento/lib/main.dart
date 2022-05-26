import 'package:bytebank_armazenamento/screens/contacts_list.dart';
import 'package:bytebank_armazenamento/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.green[900]),
          primaryColor: Colors.green[900],
          colorScheme:  ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: Dashboard(),
    );
  }
}


