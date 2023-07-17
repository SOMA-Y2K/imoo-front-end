import 'package:flutter/material.dart';

class ToolBar_BackBtn extends StatelessWidget {
  ToolBar_BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
