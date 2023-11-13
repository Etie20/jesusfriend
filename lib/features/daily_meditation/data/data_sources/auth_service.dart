import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient;
  const AuthService(this._supabaseClient);

  Future<void> signIn(String email) async {
      await _supabaseClient.auth.signInWithOtp(
        email: email,
        emailRedirectTo:
          kIsWeb ? null : 'io.supabase.jesusfriend://login-callback/'
      );
  }

  Future<void> verifyOTP(String username, String email, String otp) async {
    bool userStatus = await userExist(username);
    if(userStatus==true){
      await _supabaseClient.auth.verifyOTP(
        type: OtpType.magiclink,
        token: otp,
        email: email,
      ).catchError((err){
        print('Error : $err');
      });
    }
    else {
      final AuthResponse res = await _supabaseClient.auth.verifyOTP(
        type: OtpType.signup,
        token: otp,
        email: email,
      ).catchError((err){
        print('Error : $err');
      });
      await insertUser(username, res.session!.user.id);
    }
  }

  Future<void> insertUser(String username, String id) async {
    //final data =
    await _supabaseClient
        .from('profiles')
        .update(
      {
        'username': username,
      },
    ).eq('id', id).select();
    //return jsonDecode(data)['id'] ;
  }

  Future<bool> userExist(String username) async {
    final data = await _supabaseClient
        .from('profiles')
        .select('username').eq('username', username);
    return data[0]['username'] != null;
  }

  Future<bool> isLoggedIn() async {
    final session = _supabaseClient.auth.currentUser;
    print(session);
    return session != null;
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await _supabaseClient.auth.signOut().catchError((err){print('Erro : $err');});
    _supabaseClient.auth.refreshSession(); //mettre ici ou après le loginz
    prefs.clear();
  }
}