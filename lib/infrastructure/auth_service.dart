import 'package:social_double/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> register(String email, String password);
}