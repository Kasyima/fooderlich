import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs ',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            primary:
                false, //! Lets Flutter know that this isn't the primary scroll view.
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap:
                true, //! Creates a fixed-length scrollable list of items.
            //! This gives it a fixed height. If this were false, you'd get an unbounded height error.
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(
                post: post,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: friendPosts.length,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

//! There are several different types of scroll physics 

/*
• AlwaysScrollableScrollPhysics
• BouncingScrollPhysics
• ClampingScrollPhysics
• FixedExtentScrollPhysics
• NeverScrollableScrollPhysics
• PageScrollPhysicsRange
• MaintainingScrollPhysics
*/

