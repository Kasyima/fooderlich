import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 3: Replace and add layout widgets
    return Padding(
      padding: const EdgeInsets.all(
        30.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO 4:Add empty image
            Flexible(
              // gives a child the ability to fill the available space in the main axis
              child: AspectRatio(
                // sizes its child to the specified aspectRatio.
                // Although aspectRatio is a double, the Flutter doc recommends writing it as width / height instead of the calculated result.
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/fooderlich_assets/empty_list.png',
                ),
              ),
            ),
            // TODO 5:Add empty screen title
            const Text(
              'No Groceries',
              style: TextStyle(
                fontSize: 21.0,
              ),
            ),
            // TODO 6:Add empty screen subtitle
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              "Shopping for ingredients?\n"
              "Tap the + button to write them down!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            // TODO 7:Add browse recipes button
            MaterialButton(
              //! Standard callback
              /*
              1. Pass a callback from the parent widget all the way down the widget tree
              to a descendant widget.
              2. When ready, it fires the callback at each level up the tree and calls 
              setState() to rebuild the Home widget's subtree. 
              */

              //! Provider
              /*
              1. Wraps around inherited widgets. This package allows you to provide data
              and state information to descendant widgets.
              2. This approach is better. It allows descendant widgets in the subtree to access state info`. 
              */

              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              color: Colors.green,
              child: const Text('Browse recipes'),
            ),
          ],
        ),
      ),
    );
  }
}
