import 'package:social_double/infrastructure/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_double/models/user_model.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<UserModel> register(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final FirebaseUser user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password)).user;
    return UserModel(email: email, firstName: null);
  }
}