import 'package:equatable/equatable.dart';

abstract class TtsState {}


class TtsInitial extends TtsState {}

class TtsPlaying extends TtsState {
  final Duration listenTime;
  TtsPlaying({required this.listenTime});

}

class TtsStopped extends TtsState {}

class TtsPaused extends TtsState {
  final Duration listenTime;
  TtsPaused({required this.listenTime});
}