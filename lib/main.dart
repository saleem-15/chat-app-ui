import 'package:flutter/material.dart';
import 'package:nice_chat_app_ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat UI',
      theme: ThemeData(
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFFFEF9EB))),
      home: const HomeScreen(),
    );
  }
}
