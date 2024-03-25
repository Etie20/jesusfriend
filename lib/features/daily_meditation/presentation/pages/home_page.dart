import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_event.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/plan/plan_state.dart';
import 'package:jesusandme/features/daily_meditation/presentation/widgets/my_drawer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/cubit/colorCubit.dart';
import '../widgets/plan_container.dart';
import '../widgets/stat_container.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<ColorCubit, Color>(
        builder: (context, background) {
          return Scaffold(
            drawer: MyDrawer(backgroundColor: background),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: height,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          background,
                          Colors.black
                        ]
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  backgroundColor: background,
                                  radius: 21,
                                  child: const Image(image: AssetImage("assets/images/head.png")),
                                ),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: (){},
                                      style: ButtonStyle(
                                        elevation: const MaterialStatePropertyAll(0),
                                          backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 150)),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ))
                                      ),
                                      child: const Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontFamily: "Inter"),)
                                  ),
                                  const SizedBox(width: 10,),
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height/40,),
                        const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Text("Hi, Etie20", style: TextStyle(fontFamily: "Inter",color: Color.fromRGBO(255, 255, 255, 130)),),
                        ),
                        SizedBox(height: height/100,),
                        const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Text("Daily Meditation", style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: "Lora", fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 30,),
                        BlocBuilder<PlansBloc, PlansState>(
                            builder: (_, state) {
                              if (state is PlansLoading) {
                                return CarouselSlider(
                                    items: [0, 1, 2, 3].map(
                                          (plan) =>
                                              Shimmer.fromColors(
                                                  baseColor: Colors.grey.withOpacity(0.25),
                                                  highlightColor: Colors.white.withOpacity(0.6),
                                                  period: const Duration(seconds: 2),
                                                  child: Container(margin: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
                                                    width: width/1.5,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: Colors.grey.withOpacity(0.9)
                                                    ),
                                                  )
                                              )
                                    ).toList(),
                                    options: CarouselOptions(
                                      height: height/3,
                                      scrollDirection: Axis.horizontal,
                                      enableInfiniteScroll: false,
                                    )
                                );
                              }
                              if (state is PlansError) {
                                return Center(child: Column(
                                  children: [
                                    const SizedBox(height: 60,),
                                    Text(state.error),
                                    IconButton(onPressed: (){
                                      _.read<PlansBloc>().add(GetPlans());
                                    }, icon: Icon(Icons.refresh)),
                                  ],
                                ),);
                              }
                              if (state is PlansLoaded) {
                                return CarouselSlider(
                                    items: state.plans.map(
                                            (plan) =>
                                                PlanContainer(text: plan['plan_name'], color: plan['color'].cast<int>(), planId: plan['id'], description: plan['description'],),
                                    ).toList(),
                                    options: CarouselOptions(
                                        height: height/3,
                                        scrollDirection: Axis.horizontal,
                                      enableInfiniteScroll: false,
                                      onScrolled: (value) {
                                          int currentPage = value!.round();
                                          context.read<ColorCubit>().setColor(Color.fromRGBO(
                                            state.plans[currentPage]['color'][0],
                                            state.plans[currentPage]['color'][1],
                                            state.plans[currentPage]['color'][2],
                                            state.plans[currentPage]['color'][3].toDouble(),
                                          ));
                                      },
                                    )
                                );
                              }
                              return Container();
                            }
                        ),
                        const SizedBox(height: 20,),
                        const Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Text("Weekly Stats", style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "Inter", fontWeight: FontWeight.w200),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: SizedBox(
                            width: width,
                            height: 200,
                            child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 180,
                                    childAspectRatio: 3 / 1.2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                                itemCount: stats.length,
                                itemBuilder: (context, index){
                                  return StatContainer(text: stats[index], number: 0);
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
            ),
          );
        }
    );
  }

}