import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/models/tab_manager.dart';
import 'package:provider/provider.dart';
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
      //! Providing TabManager
      home: MultiProvider(
        //! accepts a list of providers for Home's descendant widgets to access.
        //! Use Multiprovider when you need to provide more than one Provider to a widget tree.
        providers: [
          ChangeNotifierProvider(
            //! Creates an instance of TabManager, which listens to tab index changes and notifies its listeners.
            create: (context) => TabManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => GroceryManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
