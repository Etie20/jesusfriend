import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/tts/ttsCubit.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/tts/ttsState.dart';
import 'package:jesusandme/features/daily_meditation/presentation/widgets/my_drawer.dart';

class LecturePage extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String content;
  final String verse;
  const LecturePage({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.content,
    required this.verse
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<TtsCubit, TtsState>(
        builder: (_, state) {
          return Scaffold(
            drawer: MyDrawer(backgroundColor: backgroundColor),
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
                                backgroundColor,
                                Colors.black
                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 10,),
                            Wrap(
                              children: [
                                Container(
                                  width: width/1.1,
                                  height: height/6,
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          verse,
                                          style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 16),),
                                        SizedBox(height: height/40,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ]
                            ),
                            const SizedBox(height: 20,),
                            Text(
                              title,
                              style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 30),
                            ),
                            SizedBox(
                              height: height/2.1,
                              child: SingleChildScrollView(
                                  child: Text(
                                    content,
                                    style: const TextStyle(color: Colors.white, fontFamily: "Lora", fontSize: 18),),
                                ),
                            ),
                            (state is TtsPlaying)?Text('Temps d\'écoute: ${state.listenTime.toString().substring(0, 7)}',style: const TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 15),)
                                : Container()
                      ]
                    )
                  ),
                ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: backgroundColor,
              onPressed: (){
                final ttsCubit = BlocProvider.of<TtsCubit>(context);
                if(state is TtsPlaying) {
                  ttsCubit.stop();
                }else{
                  ttsCubit.speak(content);
                }
              },
              child: state is TtsPlaying ? const Icon(Icons.stop, color: Colors.white,)
                  :const Icon(Icons.play_arrow, color: Colors.white,),
            ),
          );
        }
      );
  }

}