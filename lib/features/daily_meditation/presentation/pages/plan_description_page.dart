import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_state.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/my_drawer.dart';
import 'lecture_page.dart';

class PlanDescriptionPage extends StatelessWidget {
  final Color backgroundColor;
  final String description;

  const PlanDescriptionPage({
    super.key,
    required this.backgroundColor,
    required this.description
  });


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: MyDrawer(backgroundColor: backgroundColor),
      backgroundColor: Colors.white,
      body: Container(
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      backgroundColor,
                      Colors.black
                    ]
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: CircleAvatar(
                            backgroundColor: backgroundColor,
                            radius: 21,
                            child: const Image(image: AssetImage("assets/images/head.png")),
                          ),
                        ),
                        Builder(
                            builder: (context) {
                              return IconButton(
                                onPressed: (){
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(Icons.dashboard, color: Colors.white,),

                              );
                            }
                        ),
                          ],
                    ),
                  ),
                  SizedBox(height: height/15,),
                  Container(
                    width: width/1.1,
                    height: height/4,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(20)
                   ),
                    child:
                    BlocBuilder<PlansBloc, PlansState>(
                      builder: (context, state) {
                        if (state is PlansLoading) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.25),
                              highlightColor: Colors.white.withOpacity(0.6),
                              period: const Duration(seconds: 2),
                              child: Container(margin: const EdgeInsets.only(top: 12, right: 12, bottom: 12, left: 12),
                                height: height/40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.9)
                                ),
                              )
                          );
                        }
                        if (state is DailyContentLoaded) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(state.dailyContent[0]['title'], style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 30),),
                                Text(DateTime.now().toString().substring(0,10), style: const TextStyle(fontFamily: "Inter", color: Color.fromRGBO(255, 255, 255, 120)),)
                              ],
                            ),
                          );
                        }
                        if (state is PlansError) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(state.error, style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 30),),
                                Text(DateTime.now().toString().substring(0,10), style: const TextStyle(fontFamily: "Inter", color: Color.fromRGBO(255, 255, 255, 120)),)
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("Une Erreur s'est produite", style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 30),),
                              Text(DateTime.now().toString().substring(0,10), style: const TextStyle(fontFamily: "Inter", color: Color.fromRGBO(255, 255, 255, 120)),)
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(height: height/40,),
                  BlocBuilder<PlansBloc, PlansState>(
                    builder: (context, state) {
                      if(state is DailyContentLoaded) {
                        return ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___) =>
                                  LecturePage(
                                      backgroundColor: backgroundColor, title: state.dailyContent[0]['title'], content: state.dailyContent[0]['content'], verse: state.dailyContent[0]['verse'],)
                              ));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(backgroundColor)
                            ),
                            child: const Text(
                              "Start lecture",
                              style: TextStyle(color: Colors.white, fontFamily: "Inter", fontWeight: FontWeight.bold),
                            )
                        );
                      }
                      if(state is PlansLoading) {
                        return ElevatedButton(
                            onPressed: (){},
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 120)),
                            ),
                            child: const Text(
                              "Start lecture",
                              style: TextStyle(color: Colors.white, fontFamily: "Inter", fontWeight: FontWeight.bold),
                            )
                        );
                      }
                      return Container();
                    }
                  ),
                  SizedBox(height: height/40,),
                  const Row(
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        "Description",
                        style: TextStyle(color: Colors.white, fontFamily: "Inter", fontWeight: FontWeight.bold),
                      ),
                      Spacer()
                    ],
                  ),
                  SizedBox(height: height/40,),
                  Container(
                    width: width/1.1,
                    height: height/3,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 120),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),),
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
    );
  }
}