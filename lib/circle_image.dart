import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.imageRadius,
    this.imageProvider,
  });
  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // ignore: sort_child_properties_last
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
      backgroundColor: Colors.white,
      radius: imageRadius,
    );
  }
}
