import 'package:social_double/framework/firebase_auth_service.dart';
import 'package:social_double/pages/registration/view_model.dart';

class RegistrationViewModelFactory {

  RegistrationViewModel create() {
    return RegistrationViewModel(FirebaseAuthService());
  }

}