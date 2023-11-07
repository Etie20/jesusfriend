import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MyDrawer extends StatelessWidget {
  final Color backgroundColor;
  const MyDrawer({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.white.withOpacity(0.4),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundColor: backgroundColor,
                      radius: 29,
                      child: const Image(image: AssetImage("assets/images/head.png")),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Text("Etie20", style: TextStyle(fontFamily: "Inter",color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w700),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Text("foyangjunior02@gmail.com", style: TextStyle(fontFamily: "Inter",color: Color.fromRGBO(255, 255, 255, 130), fontWeight: FontWeight.w700),),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Row(
              children: [
                SizedBox(width: 10,),
                Icon(LucideIcons.home, color: Colors.white,),
                SizedBox(width: 10,),
                Text("Home", style: TextStyle(fontFamily: "Inter",color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300, fontSize: 18),),
              ],
            ),
          ),
          const Divider(thickness: 1, color: Colors.white,),
          const SizedBox(height: 8,),
          const InkWell(
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(LucideIcons.settings, color: Colors.white,),
                SizedBox(width: 10,),
                Text("Settings", style: TextStyle(fontFamily: "Inter",color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300, fontSize: 19),),
              ],
            ),
          ),
          const Divider(thickness: 1, color: Colors.white,),
        ],
      ),
    );
  }

}