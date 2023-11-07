import 'package:flutter/material.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/plan_description.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:route_transitions/route_transitions.dart';

import '../pages/plan_description_page.dart';

class PlanContainer extends StatelessWidget {
  final String text;
  final List<int> color;
  final int planId;
  final String description;

  const PlanContainer({super.key, required this.text, required this.color, required this.planId, required this.description});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        slideRightWidget(newPage: PlanDescription(planId: planId, backgroundColor: Color.fromRGBO(color[0], color[1], color[2], color[3].toDouble()), description: description,), context: context);
      },
      child: Container(
        width: width/1.5,
        decoration: BoxDecoration(
          color: Color.fromRGBO(color[0], color[1], color[2], color[3].toDouble()),
          borderRadius: BorderRadius.circular(20)
        ),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 30,),
                // Row(
                //   children: [
                //     const Spacer(),
                //     Padding(
                //       padding: const EdgeInsets.only(right: 10, top: 10),
                //       child: IconButton(
                //           onPressed: (){
                //             slideRightWidget(newPage: PlanDescription(planId: planId, backgroundColor: Color.fromRGBO(color[0], color[1], color[2], color[3].toDouble()), description: description,), context: context);
                //           },
                //           style: ButtonStyle(
                //               iconSize: const MaterialStatePropertyAll(17),
                //               backgroundColor: const MaterialStatePropertyAll(Colors.white),
                //               shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(10)
                //               ))
                //           ),
                //           icon: const Icon(LucideIcons.arrowUpRightFromCircle)
                //       ),
                //     )
                //   ],
                // ),
                Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30, top: 0),
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: (text.length>25)?24:28, fontFamily: "Lora", fontWeight: FontWeight.bold),),
                  ),
                const Image(image: AssetImage("assets/images/Ellipse 2.png"))
              ],
            )

      ),
    );
  }

}