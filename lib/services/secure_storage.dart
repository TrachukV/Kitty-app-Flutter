import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kitty_app/models/user_model/usermodel.dart';

class SecuredStorageService {
  static const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // static Future<Map<String, dynamic>> readAll() async {
  //   return await storage.readAll();
  // }

  static Future<UserModel?> readAll() async {
    final rawData = await storage.readAll();
    if(rawData.isEmpty) return null;
    return UserModel(userName: rawData['userName']!,
        eMail: rawData['email']!,
        pathToAvatar: rawData['pathToAvatar']!,
        id: 0,
        biometrics: rawData['bio']! == 'true'? true : false,
        pinCode: rawData['pin']!);
  }
static bool bio = false;

  static Future<String?> readUser() async {
    return await storage.read(key: 'email');
  }

  static Future<String?> readInfoUser({required String key}) async {
    return await storage.read(key: key);
  }

  static Future<void> saveUser({required UserModel userModel}) async {
    await storage.write(
      key: 'pin',
      value: userModel.pinCode,
    );
    await storage.write(
      key: 'email',
      value: userModel.eMail,
    );
    await storage.write(
      key: 'pathToAvatar',
      value: userModel.pathToAvatar,
    );
    await storage.write(
      key: 'userName',
      value: userModel.userName,
    );
    await storage.write(
      key: 'bio',
      value: userModel.biometrics.toString(),
    );
  }

  static Future<void> deleteUsers() async {
    await storage.deleteAll();
  }

  static Future<void> deleteUser(String id) async {
    await storage.delete(key: id);
  }

  static Future<void> saveLast(String id) async {
    await storage.write(key: 'lastUser', value: id);
  }
  static bool changeLanguage = false;
}
