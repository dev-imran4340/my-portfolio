import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_porfolio/app/app.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  VisibilityDetectorController.instance.updateInterval = Duration.zero;

  testWidgets('Portfolio renders identity and primary CTA', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.text('Explore Selected Work'), findsOneWidget);
    expect(find.textContaining('Malik Muhammad Imran'), findsWidgets);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 5));
  });
}
