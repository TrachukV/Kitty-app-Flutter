import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/routes/app_routes.dart';

import 'blocs/database_bloc/database_bloc.dart';
import 'database/local_database.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DatabaseBloc(DBProvider())
            ..add(
              DatabaseInitialEvent(),
            ),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
