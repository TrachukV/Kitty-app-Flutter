part of 'user_bloc.dart';

enum AuthStatus {
  initial,
  authed,
  error,
}

enum ErrorStatus {
  valid,
  error,
  initial,
}

class UserState extends Equatable {
  final ErrorStatus errorStatus;
  final String pathImage;
  final String pin;
  final AuthStatus status;
  final String userId;
  final UserModel userModel;
  final bool biometrics;
  final String errorMessage;

  const UserState(
      {this.biometrics = false,
      this.errorMessage = '',
      this.userModel = const UserModel(
          userName: '',
          eMail: '',
          pathToAvatar: '',
          id: 0,
          biometrics: false,
          pinCode: ''),
      this.userId = '',
      this.pathImage = '',
      this.pin = '',
      this.errorStatus = ErrorStatus.initial,
      this.status = AuthStatus.initial});

  UserState copyWith({
    ErrorStatus? errorStatus,
    String? errorMessage,
    String? userId,
    bool? biometrics,
    UserModel? userModel,
    String? pathImage,
    String? pin,
    AuthStatus? status,
  }) {
    return UserState(
      errorStatus: errorStatus ?? this.errorStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
      userId: userId ?? this.userId,
      biometrics: biometrics ?? this.biometrics,
      pathImage: pathImage ?? this.pathImage,
      pin: pin ?? this.pin,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        errorStatus,
        errorMessage,
        userId,
        pathImage,
        pin,
        status,
        userModel,
        biometrics,
      ];
}
