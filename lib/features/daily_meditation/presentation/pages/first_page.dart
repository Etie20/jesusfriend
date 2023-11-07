import 'package:flutter/material.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/login_page.dart';
import 'package:route_transitions/route_transitions.dart';

import '../../data/user_preferences.dart';
import '../widgets/button.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  UserPreferences prefs = UserPreferences();

  FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: prefs.orange,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/images/help_by_him.png")),
            SizedBox(height: heigth/20,),
            const Text("Welcome", style: TextStyle(color: Colors.white, fontFamily: "inter", fontSize: 28, fontWeight: FontWeight.bold),),
            const Text(
              '''Just spends a little time with Jesus. The bible says in Hosea 4:6 "My people are destroyed for lack of knowledge", so open your heart and listen.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: "lora", fontWeight: FontWeight.w500, fontSize: 17),

            ),
            SizedBox(height: heigth/5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width/1.6,
                  height: heigth/13,
                  child: Button(
                    name: 'Get started',
                    onPressed: () {
                      slideRightWidget(newPage: LoginPage(), context: context);
                    },
                    iconData: Icons.arrow_forward_ios, isLoading: false,
                  )
                )
              ],
            )
          ],
        ),
      )
      ),
    );
  }
}
