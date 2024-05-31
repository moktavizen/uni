
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';

class HizbBorder extends StatelessWidget {
  const HizbBorder({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        surahNumber,
        SizedBox(
          width: 36,
          height: 36,
          child: Center(child: child),
        ),
      ],
    );
  }
}

