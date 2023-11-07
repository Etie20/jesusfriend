import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:jesusandme/features/daily_meditation/presentation/bloc/tts/ttsState.dart';

class TtsCubit extends Cubit<TtsState> {
  Duration listenTime = Duration.zero;
  final FlutterTts flutterTts;
  TtsCubit(this.flutterTts):super(TtsInitial());

  Timer? _timer;

  Future speak(String text) async {

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      listenTime += const Duration(seconds: 1);
      emit(TtsPlaying(listenTime: listenTime));
    });
    await flutterTts.setLanguage("fr-FR");
    await flutterTts.setVoice({"name": "fr-fr-x-frc-local", "locale": "fr-FR"});
    await flutterTts.speak(text).then((value) {
      _timer?.cancel();
      _timer = null;
      emit(TtsStopped());
      listenTime = Duration.zero;
    });
  }

  Future stop() async {
    await flutterTts.stop();
    emit(TtsStopped());
  }

}