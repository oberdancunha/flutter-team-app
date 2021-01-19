import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'config_reader.dart';
import 'presentation/core/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  runApp(ModularApp(
    module: AppModule(),
  ));
}
