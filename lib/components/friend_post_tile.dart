import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageRadius: 20,
          imageProvider: AssetImage(post.profileImageUrl),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          //! makes the children fill the rest of the container.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} mins ago',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
/* There's no height restriction on FriendPostTile. That means the text can
   expand to many lines as long as it's in a scroll view! This is like iOS's
   dynamic table views and autosizing TextViews in Android.
*/
