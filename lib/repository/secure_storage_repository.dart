import 'dart:async';
import 'dart:convert';

import 'package:kitty_app/models/user_model/usermodel.dart';
import 'package:kitty_app/services/secure_storage.dart';
import 'package:uuid/uuid.dart';

class SecureStorageRepository {
  final uuid = const Uuid();

  Future<String> createUser({required UserModel user}) async {
    final id = user.eMail;
    final userInfo = jsonEncode(user);
    await SecuredStorageService.saveUser(userModel: user);
    return id;
  }


Future<String?> getId()  async {
    final id = await SecuredStorageService.readUser();
    if(id == null) return '';
    return id;
}
Future<String?> getInfo() async {
  final checkUser = getId();
    if(checkUser != null ) {

    }
}

  Future<UserModel?> getUser()async{
    final user = await SecuredStorageService.readUser();
    if(user == null) return null;
    return UserModel.fromJson(jsonDecode(user));
  }

}
