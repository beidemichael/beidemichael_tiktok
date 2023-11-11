import 'package:beidemichael_tiktok/provider/viewProvider.dart';
import 'package:beidemichael_tiktok/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ViewProvider(),
        child: HomePage(),
      ),
    );
  }
}
