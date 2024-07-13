import 'package:automotive_project/core/values/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  const AppBarTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: MyThemes.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
