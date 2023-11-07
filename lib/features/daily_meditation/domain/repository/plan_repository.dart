import 'package:jesusandme/core/resources/data_state.dart';
import 'package:jesusandme/features/daily_meditation/domain/entities/daily_content.dart';
import 'package:jesusandme/features/daily_meditation/domain/entities/plan.dart';

abstract class PlanRepository {
  //Supabase methods
  Future<DataState<List<PlanEntity>>> getDailyPlans();

  Future<DataState<DailyContentEntity>> getDailyContent(int planId);

  //Scrapping plan methods
  //Future<DataState<List<String>>> getWebsiteData(String planUrl);

}