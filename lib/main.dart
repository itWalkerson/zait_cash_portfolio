import 'package:flutter/material.dart';

import 'config/app.dart';
import 'core/di/dependency_injection.dart';
import 'core/utils/environment.dart';

void main() async {
  await AppEnvironment.load();

  WidgetsFlutterBinding.ensureInitialized();

  //di
  await configureDependencies();

  //supabase
  // await Supabase.initialize(url: AppEnvironment.supabaseURL, anonKey: AppEnvironment.supabaseAPI);

  //window

  runApp(const App());
}
