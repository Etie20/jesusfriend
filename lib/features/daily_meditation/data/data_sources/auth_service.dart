import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient;
  const AuthService(this._supabaseClient);

  Future<void> signIn(String email) async {
      await _supabaseClient.auth.signInWithOtp(
        email: email,
        emailRedirectTo:
          kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/'
      );
  }

  Future<bool> isLoggedIn() async {
    final session = _supabaseClient.auth.currentUser;
    return session != null;
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }
}