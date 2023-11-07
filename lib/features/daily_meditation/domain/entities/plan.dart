import 'package:equatable/equatable.dart';

class PlanEntity extends Equatable {
  final int id;
  final String author;
  final String plan_name;
  final String description;
  final String url;
  final DateTime created_at;
  final DateTime updated_at;

  const PlanEntity({
    required this.id,
    required this.author,
    required this.plan_name,
    required this.description,
    required this.url,
    required this.created_at,
    required this.updated_at
  });

  @override
  List<Object> get props => [
    id,
    author,
    plan_name,
    description,
    url,
    created_at,
    updated_at
  ];
}