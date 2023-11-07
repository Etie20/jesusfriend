import 'package:jesusandme/features/daily_meditation/domain/entities/plan.dart';

class PlanModel extends PlanEntity {
  const PlanModel({
    required int id,
    required String author,
    required String plan_name,
    required String description,
    required String url,
    required DateTime created_at,
    required DateTime updated_at
  }):super(
    id: id,
    author: author,
    plan_name: plan_name,
    description: description,
    url: url,
    created_at: created_at,
    updated_at: updated_at
  );

  factory PlanModel.fromJson(Map < String, dynamic > map) {
    return PlanModel(
      id: map['id'] ?? 0,
      author: map['author'] ?? "",
      plan_name: map['plan_name'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      created_at: DateTime.parse(map['created_at'] ?? ""),
      updated_at: DateTime.parse(map['updated_at'] ?? "")
    );
  }

  factory PlanModel.fromEntity(PlanEntity entity) {
    return PlanModel(
        id: entity.id,
        author: entity.author,
        plan_name: entity.plan_name,
        description: entity.description,
        url: entity.url,
        created_at: entity.created_at,
        updated_at: entity.updated_at
    );
  }

}