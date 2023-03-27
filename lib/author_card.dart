import 'package:flutter/material.dart';
import 'package:fooderlich/circle_image.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageRadius: 28,
                imageProvider: imageProvider,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.darkTextTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text('Favorite Pressed'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              /*A snackbar is useful to briefly display information to users when an
              action has taken place. For example, when you delete an email, you can 
              provide a user with an action to undo .*/
            },
            icon: const Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
