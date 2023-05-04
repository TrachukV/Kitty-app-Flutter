part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class GetPinEvent extends UserEvent {
  const GetPinEvent({required this.pin});

  final String pin;
}

class GetBiometricsEvent extends UserEvent {
  const GetBiometricsEvent({required this.biometrics});

  final bool biometrics;
}

class UserInitEvent extends UserEvent {}

class UserInit extends UserEvent {}

class GetAvatarEvent extends UserEvent {
  const GetAvatarEvent(this.path);

  final String path;
}

class DeleteUsers extends UserEvent {}

class GetInfoUserEvent extends UserEvent {
  const GetInfoUserEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pathToAvatar,
  });
  final String pathToAvatar;
  final String firstName;
  final String lastName;
  final String email;
}
