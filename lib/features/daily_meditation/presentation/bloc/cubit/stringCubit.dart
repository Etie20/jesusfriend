import 'package:flutter_bloc/flutter_bloc.dart';

class StringCubit extends Cubit<String> {
  StringCubit(): super('');

  void setString (String newString) => emit(newString);
}