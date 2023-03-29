import 'package:flutter/material.dart';
import 'package:fooderlich/components/author_card.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'package:fooderlich/models/explore_recipe.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key, required ExploreRecipe recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/magazine_pics/card_smoothie.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Mike Katz',
              title: 'French Champagne',
              imageProvider: AssetImage('assets/images/brainscode.jpeg'),
            ),
            Expanded(
              //! With Expanded, you fill in the remaining available space.
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 9,
                      child: Text(
                        "Smoothies",
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TODO 4: add Positioned text
          ],
        ),
      ),
    );
  }
}
