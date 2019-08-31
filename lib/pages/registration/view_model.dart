import 'dart:async';

import 'package:social_double/infrastructure/auth_service.dart';
import 'package:social_double/models/user_model.dart';

//Обычный компонент который служит "мостом" для вьюшек (виджетов) и
// бизнес-логики (доменом). Предоставляет читаемый State для виджетов и методы
// которые сигнализируют о каком-то событии (onRegisterButtonTap)
class RegistrationViewModel {
  final StreamController<RegistrationState> _stateSC = StreamController();
  final AuthService _authService;

  //Виджет подписывается на обновление состояния используя этот геттер
  Stream<RegistrationState> get stateStream => _stateSC.stream;

  RegistrationViewModel(this._authService) {
    _stateSC.add(RegistrationState.idle());
  }

  void dispose() {
    _stateSC.close();
  }

  void register(String email, String password) async {
    _stateSC.add(RegistrationState.inProgress());
    try {
      final UserModel userModel = await _authService.register(email, password);
      _stateSC.add(RegistrationState.success(userModel));
    } on Object catch (e) {
      _stateSC.add(RegistrationState.error(e));
    }
  }
}

//Описывает состояние нашего скрина (контекст) и остальные объекты которые могут
//быть нужны в процессе работы. В данном случае сам контекст (статус), ошибка
//в случае [Status.error] и [UserModel] инстанс в случае если регистрация
//прошла успешно ([Status.registered])
class RegistrationState {
  final Status status;
  final Object error;
  final UserModel user;

  RegistrationState(this.status, this.error, this.user);

  RegistrationState.idle() : this(Status.idle, null, null);

  RegistrationState.inProgress() : this(Status.inProgress, null, null);

  RegistrationState.error(Object error) : this(Status.error, error, null);

  RegistrationState.success(UserModel user) : this(Status.registered, null, user);
}

//Описывает контекст нашего скрина
enum Status {
  idle, error, inProgress, registered
}