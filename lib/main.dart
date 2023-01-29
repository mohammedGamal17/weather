import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/dependency_injection/dependency_injection.dart';
import 'app/errors/error_handler.dart';
import 'presentation/view_model/material/material_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  errorHandler();
  await DI().setup();
  runApp(
    ChangeNotifierProvider(
      create: (_) => MaterialProvider(),
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
}
