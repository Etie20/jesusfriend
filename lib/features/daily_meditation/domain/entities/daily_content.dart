import 'package:equatable/equatable.dart';

class DailyContentEntity extends Equatable{
  final int id;
  final String title;
  final String verse;
  final String body;
  final int planId;

  const DailyContentEntity({
    required this.id,
    required this.title,
    required this.verse,
    required this.body,
    required this.planId
  });

  @override
  List<Object> get props => [id, title, verse, body, planId];

}