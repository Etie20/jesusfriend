abstract class AuthRepository {

  Future<void> signIn(String email);

  Future<void> signOut();

  Future<void> updateProfile();

  Future<bool> isLoggedIn();

}