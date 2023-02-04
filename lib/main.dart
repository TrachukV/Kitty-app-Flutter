import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/repository/database_repository.dart';
import 'package:kitty_app/routes/app_routes.dart';
import 'package:path/path.dart';

import 'blocs/database_bloc/database_bloc.dart';
import 'database/local_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    RepositoryProvider(
      create: (context) => DatabaseRepo(DBProvider()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DatabaseBloc(RepositoryProvider.of<DatabaseRepo>(context))
              ..add(
                DatabaseInitialEvent(),
              ),
          ),
          BlocProvider(
              create: (context) => UserBloc()..add(UserInit()),

          ),

        ],
        child: const MaterialApp(
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}
