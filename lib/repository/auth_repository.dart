import 'package:bukateria/repository/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthRepository extends BaseAuthRepository{
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signup({required String email, required String password}) async {
    try {
     final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );

     final user = credential.user;
     return user;
    } catch (_) {
      throw Exception();
    }
  }

  @override
  // TODO: implement user
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
  
}