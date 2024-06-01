import 'package:flutter/material.dart';

class TabListTile extends StatelessWidget {
  const TabListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 4),
              subtitle,
            ],
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
