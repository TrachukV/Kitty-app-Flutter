import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';

import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/main_screen.dart';
import 'package:kitty_app/services/auth_services.dart';
import 'package:kitty_app/services/secure_storage.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

import '../create_category_screen/widgets/dotted_border.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);
  static const routeName = 'lock_screen';

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  // String image = '';
  bool isActive = false;
  bool biometrics = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String _email = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) async {
        if (state.errorStatus == ErrorStatus.error) {
          _firstNameController.clear();
          _lastNameController.clear();
          _emailController.clear();
          _email = '';
          _firstName = '';
          _lastName = '';
          showSnackBar(state);
        } else if (state.errorStatus == ErrorStatus.valid) {
          Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        print(state.userModel);
        if (state.status == AuthStatus.initial) {
          Future.delayed(const Duration(seconds: 1), () async {

            if (state.userModel.eMail.isEmpty) {
              _screenLockCreate(context, height);
            } else {
              if (state.userModel.biometrics == true) {
                final ifAuth = await LocalAuth.authenticate();
                if (ifAuth) {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
                } else {
                  final ifAuth = await LocalAuth.authenticate();
                }
              } else {
                _screenLockAuth(state);
              }
            }
          });
        }

        return Scaffold(
          floatingActionButton: state.userModel.eMail.isEmpty
              ? ValueListenableBuilder(
                  valueListenable: _emailController,
                  builder: (BuildContext context, TextEditingValue value, Widget? child) {
                    return ElevatedButton(
                      style: AppTextStyles.buttonStyle,
                      onPressed: _firstNameController.text.isNotEmpty &&
                              _emailController.text.isNotEmpty &&
                              _lastNameController.text.isNotEmpty
                          ? () {
                        BlocProvider.of<UserBloc>(context).add(GetBiometricsEvent(biometrics: SecuredStorageService.bio));

                              context.read<UserBloc>().add(
                                    GetInfoUserEvent(
                                      firstName: _firstName,
                                      lastName: _lastName,
                                      email: _email,
                                      pathToAvatar: state.pathImage,
                                    ),
                                  );

                            }
                          : null,
                      child: SizedBox(
                        width: width * 0.9,
                        child: const Center(heightFactor: 1, child: Text('Registration')),
                      ),
                    );
                  },
                )
              : null,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIcons.logo,
                Text(
                  'Kitty',
                  style: AppTextStyles.blackBold,
                ),
              ],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 15),
              child: state.userModel.eMail.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: height / 26,
                        ),
                        Center(
                          child: DottedBorderWidget(
                            width: 1,
                            size: 80,
                            color: state.pathImage.isEmpty ? AppColors.silver : AppColors.blue,
                            icon: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: GestureDetector(
                                  onTap: () async {
                                   final image = await pickImageHelper();
                                   if(mounted){
                                     context.read<UserBloc>().add(GetAvatarEvent(image));
                                   }

                                  },
                                  child: state.pathImage.isEmpty
                                      ? Icon(
                                          Icons.question_mark,
                                          color: AppColors.sonicSilver,
                                        )
                                      : Image.file(
                                          File(state.pathImage),
                                          fit: BoxFit.fill,
                                          height: 80,
                                        )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: height / 12,
                              width: width / 2.5,
                              child: TextFormField(
                                controller: _firstNameController,
                                onChanged: (value) {
                                  _firstName = value;
                                },
                                maxLength: 14,
                                textInputAction: TextInputAction.next,
                                style: AppTextStyles.blackRegular,
                                decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: AppColors.sonicSilver, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(color: AppColors.blue, width: 1)),
                                    labelText: LocaleKeys.first_name.tr(),
                                    labelStyle: AppTextStyles.greyRegular),
                              ),
                            ),
                            SizedBox(
                              height: height / 12,
                              width: width / 2.5,
                              child: TextFormField(
                                controller: _lastNameController,
                                onChanged: (value) {
                                  _lastName = value;
                                },
                                maxLength: 14,
                                textInputAction: TextInputAction.next,
                                style: AppTextStyles.blackRegular,
                                decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(color: AppColors.sonicSilver, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(color: AppColors.blue, width: 1)),
                                    labelText: LocaleKeys.last_name.tr(),
                                    labelStyle: AppTextStyles.greyRegular),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 26,
                        ),
                        SizedBox(
                          height: height / 12,
                          child: TextFormField(
                            controller: _emailController,
                            onChanged: (value) {
                              _email = value;
                            },
                            textInputAction: TextInputAction.next,
                            maxLength: 30,
                            keyboardType: TextInputType.emailAddress,
                            style: AppTextStyles.blackRegular,
                            decoration: InputDecoration(
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(color: AppColors.sonicSilver, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(color: AppColors.blue, width: 1)),
                                labelText: LocaleKeys.email.tr(),
                                labelStyle: AppTextStyles.greyRegular),
                          ),
                        ),
                        SizedBox(
                          height: height / 26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Stand with Ukraine',
                              style: AppTextStyles.greyRegular,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '🇺🇦',
                              style: AppTextStyles.blueRegular,
                            ),
                          ],
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () async {
                        final ifAuth = await LocalAuth.authenticate();
                        if (ifAuth) {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
                        } else {
                          final ifAuth = await LocalAuth.authenticate();
                        }
                      },
                      child: Center(
                        child: Container(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                AppIcons.kittiLogo,
                                height: 100,
                              ),
                              Text(
                                LocaleKeys.sign_in.tr(),
                                style: AppTextStyles.greyBold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
        );
      },
    );
  }

  void showSnackBar(UserState state) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.errorMessage,
            style: AppTextStyles.redRegular,
          ),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Icon(
              Icons.close,
              color: AppColors.grey,
            ),
          )
        ],
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      backgroundColor: AppColors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _alertDialog(BuildContext context, double height, bool biometrics) async {
    return showDialog(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              height: height / 5,
              child: Column(
                children: [
                   const Icon(
                    Icons.fingerprint,
                    size: 50,
                    color: Colors.red,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    LocaleKeys.use_biometrics.tr(),
                    style: AppTextStyles.greyRegular,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.sonicSilver),
                        ),
                        onPressed: () async {
                          final ifAuth = await LocalAuth.authenticate();
                          print(ifAuth);
                          if (ifAuth && mounted) {
                            SecuredStorageService.bio = true;

                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          LocaleKeys.yes.tr(),
                          style: AppTextStyles.whiteRegular,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.sonicSilver),
                        ),
                        onPressed: () {
                          SecuredStorageService.bio = false;
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          LocaleKeys.no.tr(),
                          style: AppTextStyles.whiteRegular,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> _screenLockAuth(UserState state) {
    return screenLock(

      canCancel: false,
      onUnlocked: () {
        Navigator.of(context).pop();
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
      },
      title: Column(
        children: [
          SvgPicture.asset(
            AppIcons.kittiLogo,
            height: 120,
          ),
          Text(
            'Enter your pin',
            style: AppTextStyles.greyCategory,
          ),
        ],
      ),
      context: context,
      correctString: state.userModel.pinCode,
      secretsConfig: SecretsConfig(
        spacing: 30,
        padding: const EdgeInsets.all(40),
        secretConfig: SecretConfig(
          borderColor: Colors.grey,
          borderSize: 2,
          disabledColor: AppColors.white.withOpacity(0.2),
          enabledColor: Colors.black38,
          size: 20,
        ),
      ),
      keyPadConfig: KeyPadConfig(
        buttonConfig: KeyPadButtonConfig(
          buttonStyle: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            backgroundColor: AppColors.white.withOpacity(0.2),
          ),
        ),
      ),
      config: ScreenLockConfig(
        backgroundColor: AppColors.white.withOpacity(0.8),
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: Colors.grey,
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: AppColors.white.withOpacity(0.8),
        ),
      ),
    );
  }

  Future<void> _screenLockCreate(
    BuildContext context,
    double height,
  ) {
    return screenLockCreate(
      useLandscape: false,
      canCancel: false,
      secretsConfig: SecretsConfig(
        spacing: 30,
        padding: const EdgeInsets.all(40),
        secretConfig: SecretConfig(
          borderColor: Colors.grey,
          borderSize: 2,
          disabledColor: AppColors.white.withOpacity(0.2),
          enabledColor: Colors.black38,
          size: 20,
        ),
      ),
      keyPadConfig: KeyPadConfig(
        buttonConfig: KeyPadButtonConfig(
          buttonStyle: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            backgroundColor: AppColors.white.withOpacity(0.2),
          ),
        ),
      ),
      config: ScreenLockConfig(
        backgroundColor: AppColors.white.withOpacity(0.8),
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: Colors.grey,
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: AppColors.white.withOpacity(0.8),
        ),
      ),
      title:  AppBarPinWidget(
        title: LocaleKeys.enter_new_pin.tr(),
      ),
      confirmTitle:  AppBarPinWidget(
        title: LocaleKeys.re_enter_pin.tr(),
      ),
      context: context,
      onConfirmed: (value) async {
        context.read<UserBloc>().add(GetPinEvent(pin: value));
        print(value);
        Navigator.of(context).pop();
        // Future.delayed(
        //   const Duration(milliseconds: 100),
        //
        // );
        if (await authenticateIsAvailable()) {
          _alertDialog(context, height, biometrics);
        }
      },
      cancelButton: const Icon(
        Icons.close_rounded,
        color: Colors.black,
      ),
      deleteButton: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}

Future<bool> authenticateIsAvailable() async {
  final isAvailable = await LocalAuth.canAuthenticate();
  final isDeviceSupported = await LocalAuth.supported();
  return isAvailable && isDeviceSupported;
}

class AppBarPinWidget extends StatelessWidget {
  const AppBarPinWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.kittiLogo,
          height: 120,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: AppTextStyles.greyBold,
        ),
      ],
    );
  }
}
