import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: color,
          child: state.userModel.pathToAvatar.isEmpty
              ? Text(state.userModel.userName.substring(0, 1),
              style: AppTextStyles.blackMedium)
              : ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              File(state.userModel.pathToAvatar),
              fit: BoxFit.fill,
              height: 40,
            ),
          ),
        );
      },
    );
  }
}
