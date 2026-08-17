import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/utils/url_strategy_stub.dart'
    if (dart.library.js_interop) 'core/utils/url_strategy_web.dart';

void main() {
  configureUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}
