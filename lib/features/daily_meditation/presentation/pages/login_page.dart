import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_event.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_state.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/cubit/stringCubit.dart';
import 'package:jesusandme/features/daily_meditation/presentation/pages/otp_page.dart';

import '../../../../injection_container.dart';
import '../../data/user_preferences.dart';
import '../widgets/button.dart';
import '../widgets/line.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    UserPreferences prefs = UserPreferences();

    return Scaffold (
      backgroundColor: prefs.orange,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage("assets/images/login.png")),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: BlocProvider(
                        create: (_) => StringCubit(),
                        child: BlocBuilder<StringCubit, String>(
                          builder: (context, email) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Login", style: TextStyle(color: Colors.white, fontFamily: "inter", fontSize: 28, fontWeight: FontWeight.bold),),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.person, color: Colors.white,),
                                    const SizedBox(width: 20,),
                                    SizedBox(
                                      width: width/1.5,
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          // Vérifie si le champ de texte est vide
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          context.read<StringCubit>().setString(value.trim());
                                        },
                                        style: const TextStyle(color: Colors.white, fontFamily: "Inter"),
                                        decoration: const InputDecoration(
                                            hintText: "Username",
                                            hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.email_outlined, color: Colors.white,),
                                    const SizedBox(width: 20,),
                                    SizedBox(
                                      width: width/1.5,
                                      child: TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          // Vérifie si le champ de texte est vide
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          // Vérifie si l'email est valide en utilisant une expression régulière (regex)
                                          final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                          if (!regex.hasMatch(value.trim())) {
                                            return 'Please enter a valid email';
                                          }
                                          context.read<StringCubit>().setString(value.trim());
                                        },
                                        style: const TextStyle(color: Colors.white, fontFamily: "Inter"),
                                        decoration: const InputDecoration(
                                            hintText: "Email",
                                           hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: heigth/20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocProvider<AuthBloc>(
                                      create: (_) => sl(),
                                      child: BlocListener<AuthBloc, AuthState>(
                                        listener: (_, state){
                                          if (state is AuthSuccess) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Check your email for a login link!')),
                                            );
                                          }
                                          if (state is AuthError) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text('Unexpected error occured!')),
                                            );
                                          }
                                        },
                                        child: BlocBuilder<AuthBloc, AuthState>(
                                          builder: (_, state) {
                                            if (state is AuthInitial) {
                                              return SizedBox(
                                                  width: width / 1.6,
                                                  height: heigth / 13,
                                                  child: Button(name: 'Login',
                                                    onPressed: () {
                                                    _.read<AuthBloc>().add(LoginPressed(email: email));
                                                      /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                                        return OtpPage(email: email);
                                                      },));*/
                                                    },
                                                    iconData: null,
                                                    isLoading: false,
                                                  )
                                              );
                                            }
                                            if (state is AuthLoading) {
                                              return SizedBox(
                                                  width: width / 1.6,
                                                  height: heigth / 13,
                                                  child: Button(name: 'Login',
                                                    onPressed: () {},
                                                    iconData: null,
                                                    isLoading: true,
                                                  )
                                              );
                                            }
                                            return SizedBox(
                                                width: width / 1.6,
                                                height: heigth / 13,
                                                child: Button(name: 'Login',
                                                  onPressed: () {},
                                                  iconData: null,
                                                  isLoading: false,
                                                )
                                            );
                                          }
                                        ),
                                      )
                                    )
                                  ],
                                ),
                                SizedBox(height: heigth/25,),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Line(),
                                    SizedBox(width: 20,),
                                    Text("OR", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Inter"),),
                                    SizedBox(width: 20,),
                                    Line(),
                                  ],
                                ),
                                SizedBox(height: heigth/25,),
                                Row(
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width: width/1.4,
                                      child: ElevatedButton(
                                          onPressed: (){

                                          },
                                          style: ButtonStyle(
                                              backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15)
                                              ))
                                          ),
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image(image: AssetImage("assets/images/google_logo.png"), width: 30, height: 50,),
                                              Text("Login with Google", style: TextStyle(color: Colors.black, fontFamily: "Inter", fontWeight: FontWeight.bold),),
                                            ],
                                          )
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }

}