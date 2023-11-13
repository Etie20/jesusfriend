import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_bloc.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_event.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/auth/auth_state.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/cubit/stringCubit.dart';

import '../../../../injection_container.dart';
import '../../data/user_preferences.dart';
import '../widgets/button.dart';
import '../widgets/line.dart';

class OtpPage extends StatelessWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  Widget fieldOTP(TextEditingController controller, BuildContext context){
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.only(left: 1,),
      margin: const EdgeInsets.only(left: 7,right: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child:
      Center(
        child :
        TextField(
          controller: controller,
          autofocus: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          keyboardType: TextInputType.none,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            enabled: false,
            enabledBorder:
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)
            ),
            focusedBorder:
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)
            ),
            focusedErrorBorder:
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white)
            ),
          ),
        ),
      )
      ,);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    UserPreferences prefs = UserPreferences();
    final List<TextEditingController> control = [
      for(int i=0; i<6; i++)
        TextEditingController()
    ];

    return Scaffold (
      backgroundColor: prefs.orange,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage("assets/images/otp.png")),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: BlocProvider(
                      create: (_) => StringCubit(),
                      child: BlocBuilder<StringCubit, String>(
                          builder: (context, email) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Enter otp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "inter",
                                    fontSize: 28,
                                    fontWeight:
                                    FontWeight.bold),
                                ),
                                const SizedBox(height: 10,),
                                const Text("An 4 digit code has been sent to",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "inter",
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                SizedBox(height: heigth/20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      control.length, (index) => fieldOTP(control[index], context)
                                  ),
                                ),
                                SizedBox(height: heigth/20,),
                                SizedBox(
                                  width: width / 1.6,
                                  height: heigth / 13,
                                  child: Button(
                                      name: 'Submit',
                                      onPressed: () {

                                      },
                                      iconData: null,
                                      isLoading: false
                                  ),
                                )
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