import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/generated/codegen_loader.g.dart';
import 'package:kitty_app/repository/database_repository.dart';
import 'package:kitty_app/routes/app_routes.dart';


import 'blocs/database_bloc/database_bloc.dart';
import 'database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('en'),
        Locale('uk'),
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: RepositoryProvider(
        create: (con) => DatabaseRepo(DBProvider()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (con) => DatabaseBloc(RepositoryProvider.of<DatabaseRepo>(con))
                ..add(
                  DatabaseInitialEvent(),
                ),
            ),
            BlocProvider(
              create: (con) => UserBloc()..add(UserInit()),
            ),
          ],
          child: const KittyApp(),
        ),
      ),
    ),
  );
}

class KittyApp extends StatelessWidget {
  const KittyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
