import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String width = (MediaQuery.of(context).size.width).toString();
    final String height = (MediaQuery.of(context).size.height).toString();

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            width,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            height,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
