import 'package:flutter/material.dart';
import 'package:fooderlich/card1.dart';
import 'package:fooderlich/card2.dart';
import 'package:fooderlich/card3.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // _selectedIndex keeps track of which tab is currently selected.
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  // 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    } /* This function handles tapped tab bar items. Here, you set the index of the item
that the user pressed. setState() notifies the framework that the state of this
object has changed, then rebuilds this widget internally.*/
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Show selected tab
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          // ignore: todo
          // TODO: Set selected tab bar
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          // 6
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card3',
            ),
          ]),
    );
  }
}
