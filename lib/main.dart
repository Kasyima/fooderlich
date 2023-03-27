import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';
import 'home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({super.key});

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    //? TODO: Apply Home widget
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: Home(),
    );
  }
}
