import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 120,child:
        Divider(thickness: 1.2, color: Colors.black,)
    );

  }

}