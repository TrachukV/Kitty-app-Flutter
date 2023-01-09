import 'package:flutter/material.dart';
import 'package:kitty_app/routes/app_routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
