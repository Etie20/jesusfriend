import 'package:flutter/material.dart';

class StatContainer extends StatelessWidget {
  final String text;
  final int number;

  const StatContainer({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(255, 255, 255, 150),

    ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 90,
              child: Text(
                text,
              style: const TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 100), fontFamily: "Lora", fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              number.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Inter", fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }

}