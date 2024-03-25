abstract class AuthRepository {

  Future<void> signIn(String email);

  Future<void> signOut();

  Future<void> verifyOtp(String username, String email, String otp);

  Future<void> updateProfile();

  Future<bool> isLoggedIn();

}