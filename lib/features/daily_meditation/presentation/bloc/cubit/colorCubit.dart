import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/user_preferences.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit():super(UserPreferences().orange);

  void setColor(Color newColor) => emit(newColor);
}