import 'package:jesusandme/features/daily_meditation/domain/entities/daily_content.dart';

class DailyContentModel extends DailyContentEntity {
  const DailyContentModel({
    required int id,
    required String title,
    required String verse,
    required String body,
    required int planId
  }):super(
    id: id,
    title: title,
    verse: verse,
    body: body,
    planId: planId
  );

  factory DailyContentModel.fromJson(Map < String, dynamic > map) {
    return DailyContentModel(
        id: map['id'] ?? 0,
        title: map['title'] ?? "",
        verse: map['verse'] ?? "",
        body: map['body'] ?? "",
        planId: map['plan_id'] ?? 0
    );
  }

  factory DailyContentModel.fromEntity(DailyContentEntity entity) {
    return DailyContentModel(
        id: entity.id,
        title: entity.title,
        verse: entity.verse,
        body: entity.body,
        planId: entity.planId,
    );
  }




}