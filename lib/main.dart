import 'package:flutter/material.dart';
import 'package:provider_demo/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.path,
      routes: {
        HomeScreen.path: (context) => const HomeScreen(title: 'Provider Demo'),
      },
    );
  }
}