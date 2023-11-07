import 'package:flutter_bloc/flutter_bloc.dart';

class RawHtmlCubit extends Cubit<String> {
  RawHtmlCubit(): super("");

  void setRawHtml(String rawHtml) => emit(rawHtml);
}