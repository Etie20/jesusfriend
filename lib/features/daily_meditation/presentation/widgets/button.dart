import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final bool isLoading;
  const Button({super.key, required this.name, required this.onPressed, required this.iconData, required this.isLoading});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            (iconData) != null?const Offstage():const Spacer(),
            (!isLoading)?Text(name, style: const TextStyle(color: Colors.black, fontFamily: "Inter", fontWeight: FontWeight.bold),)
            :const SizedBox(height: 30,width: 30,child: const CircularProgressIndicator(color: Colors.black, strokeWidth: 1,))
            ,
            (iconData) != null?Icon(iconData, color: Colors.black,size: 15,):Container(),
            (iconData) != null?const Offstage():const Spacer(),
          ],
        )
    );
  }

}