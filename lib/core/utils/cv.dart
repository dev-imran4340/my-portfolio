import 'cv_stub.dart' if (dart.library.js_interop) 'cv_web.dart' as impl;

/// Opens / downloads the portfolio CV asset (PDF).
Future<void> openCv() => impl.openCvAsset();
