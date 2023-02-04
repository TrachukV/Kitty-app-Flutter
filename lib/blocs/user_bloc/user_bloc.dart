import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty_app/models/user_model/usermodel.dart';
import 'package:kitty_app/repository/secure_storage_repository.dart';
import 'package:kitty_app/services/secure_storage.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    final SecureStorageRepository secureStorageRepository = SecureStorageRepository();
    on<UserInit>((event, emit) async {
      final userModel = await SecuredStorageService.readAll();
      print(userModel);
      if (userModel != null) {
        emit(state.copyWith(userModel: userModel));
      }
    });

    on<GetInfoUserEvent>((event, emit) async {
      final validator = validateEmail(event.email);
      if (validator != null) {
        emit(state.copyWith(
          errorStatus: ErrorStatus.error,
          errorMessage: validator,
        ));
      } else {
        print(event.lastName);
        print(event.firstName);
        final currentUser = UserModel(
            userName: '${event.firstName} ${event.lastName}',
            eMail: event.email,
            pathToAvatar: event.pathToAvatar,
            id: 0,
            biometrics: state.biometrics,
            pinCode: state.pin);
        final String id = await secureStorageRepository.createUser(user: currentUser);
        emit(state.copyWith(
          errorStatus: ErrorStatus.valid,
          userModel: currentUser,
          userId: id,
        ));
      }
    });

    on<UserInitEvent>((event, emit) async {
      final userModel = await SecuredStorageService.readAll();
      print('${userModel}');
      if (userModel != null) {
        emit(state.copyWith(userModel: userModel));
      }
    });
    on<GetBiometricsEvent>((event, emit) {
      final bool biometrics = event.biometrics;
      emit(state.copyWith(
        biometrics: biometrics,
      ));
    });

    on<GetPinEvent>((event, emit) {
      emit(state.copyWith(
        pin: event.pin,
        status: AuthStatus.authed,
      ));
    });
    on<GetAvatarEvent>((event, emit) {
      emit(state.copyWith(
        pathImage: event.path,
      ));
    });
  }

  String? validateEmail(String email) {
    if (!validateEmailHelper(email)) {
      return 'Please enter correct email';
    }
    return null;
  }
}

// final id = await SecuredStorageService.readUser();
