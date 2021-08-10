import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back2.webp'),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
    );
  }
}
