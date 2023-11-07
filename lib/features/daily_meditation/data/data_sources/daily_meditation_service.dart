import 'package:supabase_flutter/supabase_flutter.dart';

class DailyPlansService {
  final SupabaseClient _supabaseClient;
  const DailyPlansService(this._supabaseClient);

  Future<List<dynamic>> getPlans() async {
    final response = await _supabaseClient.from('plan').select();
    return response;
  }

  Future<dynamic> getDailyContent(int planId) async {
    final response = await _supabaseClient.from('daily_content').select().eq('plan_id', planId);
    return response;
  }
}
