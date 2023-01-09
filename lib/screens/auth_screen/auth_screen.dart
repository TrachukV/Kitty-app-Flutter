import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';

class AuthScreen extends StatefulWidget {
   const AuthScreen({Key? key}) : super(key: key);
  // static const routeName = '/';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                screenLockCreate(
                  context: context,
                  title: const Text('Enter a new pin'),
                  confirmTitle: const Text('Re-enter your pin'),
                  onConfirmed: (value) => Navigator.of(context).pop(),
                  config: const ScreenLockConfig(
                    backgroundColor: Colors.white,
                    titleTextStyle: TextStyle(fontSize: 24, color: Colors.black87),
                  ),
                  keyPadConfig: KeyPadConfig(
                    buttonConfig: KeyPadButtonConfig(
                      buttonStyle: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                        textStyle: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  secretsConfig: const SecretsConfig(
                    spacing: 30,
                    padding: EdgeInsets.all(40),
                    secretConfig: SecretConfig(
                      borderColor: Colors.grey,
                      borderSize: 1,
                      disabledColor: Colors.grey,
                      enabledColor: Colors.blue,
                      size: 20,
                    ),
                  ),
                  cancelButton: const Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ),
                  deleteButton: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.black,
                  ),
                );
              },
              child: AppIcons.blackHealthAndSafety,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
          }, child: AppIcons.blackHomePressed)
        ],
      ),
    );
  }
}
