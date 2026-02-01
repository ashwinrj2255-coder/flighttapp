import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: AppProviders.providers, child: const MyApp()),
  );
}
